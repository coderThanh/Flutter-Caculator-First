import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../models/app_const_model.dart';
import '../../models/app_pattern_model.dart';
import '../../models/express_history_model.dart';
import '../../models/keypress_model.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc()
      : super(CalculatorLoadded(
          express: CalculatorInitial.express,
          expressHistory: CalculatorInitial.expressHistory,
          result: CalculatorInitial.result,
          resultError: CalculatorInitial.resultError,
          wasEqualPressBefore: CalculatorInitial.wasEqualPressBefore,
        )) {
    on<CalculatorEventKeyPress>((event, emit) {
      if (state is CalculatorLoadded) {
        CalculatorLoadded state = this.state as CalculatorLoadded;

        if (state.wasEqualPressBefore &&
            event.keyPress.value != AppConst.equal) {
          // _wasEqualPressBefore = false;
          state = state.copyWith(wasEqualPressBefore: false);
        }

        switch (event.keyPress.type) {
          case AppConst.keyOperator:
            logicKeyOprerator(
              keyPress: event.keyPress,
              emit: emit,
              currentState: state,
            );
            break;

          case AppConst.keyAction:
            logicKeyAction(
              keyPress: event.keyPress,
              emit: emit,
              currentState: state,
            );
            break;

          default: //Keynum
            logicKeyNum(
              keyPress: event.keyPress,
              emit: emit,
              currentState: state,
            );
        }
      }
    });

    on<CalculatorEventRestore>((event, emit) {
      if (state is CalculatorLoadded) {
        CalculatorLoadded state = this.state as CalculatorLoadded;
        emit(state.copyWith(
          express: event.express,
          result: event.result,
        ));
      }
    });
  }
}

// Logic Key number
void logicKeyNum({
  required KeyPress keyPress,
  required Emitter<CalculatorState> emit,
  required CalculatorLoadded currentState,
}) {
  final List<KeyPress> _express = [...currentState.express];
  double _result = currentState.result;

  if (_express.isNotEmpty &&
      _express[_express.length - 1].type == AppConst.keyNum) {
    // Check if number have decimal Serparator before
    if (keyPress.value == AppConst.decimalSerpa &&
        _express[_express.length - 1].value.contains(AppConst.decimalSerpa)) {
      return;
    }

    if (_express[_express.length - 1].value.length < 12) {
      String newKeyValue = _express[_express.length - 1].value + keyPress.value;

      _express[_express.length - 1] =
          _express[_express.length - 1].copyWith(value: newKeyValue);

      _result = 0;
    }
  } else {
    _express.add(keyPress);
  }

  emit(currentState.copyWith(
    express: _express,
    result: _result,
  ));
}

// Logic Key operator
void logicKeyOprerator({
  required KeyPress keyPress,
  required Emitter<CalculatorState> emit,
  required CalculatorLoadded currentState,
}) {
  if (currentState.express.isEmpty) {
    return;
  }

  List<KeyPress> _express = [...currentState.express];
  double _result = currentState.result;

  if (_result == double.infinity) {
    _express = [];
    _result = 0;
  } else if (_result != 0) {
    // Continute with new result math
    _express = [
      KeyPress(
        type: AppConst.keyNum,
        value: AppNumPattern().toStringDecimalPattern(_result),
      ),
      keyPress,
    ];

    _result = 0;
  } else if (_express[_express.length - 1].type == AppConst.keyOperator) {
    _express[_express.length - 1] = keyPress;
  } else {
    _express.add(keyPress);
  }

  emit(currentState.copyWith(result: _result, express: _express));
}

// Logic Key action
void logicKeyAction({
  required KeyPress keyPress,
  required Emitter<CalculatorState> emit,
  required CalculatorLoadded currentState,
}) {
  // Create default var because currentSate is const
  List<KeyPress> _express = [...currentState.express];
  List<ExpressHistory> _expressHistory = [...currentState.expressHistory];
  double _result = currentState.result;
  bool _wasEqualPressBefore = currentState.wasEqualPressBefore;
  bool _resultError = currentState.resultError;

  // Middleware check something before run Logic
  if (_express.isEmpty || _wasEqualPressBefore) {
    return;
  }

  // Create express calculator pub
  Parser expressCalculator = Parser();

  // Run logic
  switch (keyPress.value) {
    case AppConst.ac:
      // Delete all
      _express = [];
      _result = 0;

      emit(currentState.copyWith(
        express: _express,
        result: _result,
      ));
      break;

    case AppConst.delete:
      // Remove Number
      KeyPress _lastExpress = _express[_express.length - 1];
      _result = 0;

      if (_lastExpress.type == AppConst.keyOperator ||
          _lastExpress.value.length == 1) {
        _express.removeLast();
      } else {
        String newValue = _lastExpress.value.substring(
          0,
          _lastExpress.value.length - 1,
        );
        _express[_express.length - 1] =
            _express[_express.length - 1].copyWith(value: newValue);
      }

      emit(currentState.copyWith(
        express: _express,
        result: _result,
      ));

      break;

    case AppConst.equal:
      // Calculate express
      _wasEqualPressBefore = true;

      // Check last is operator
      if (_express[_express.length - 1].type == AppConst.keyOperator) {
        _express.removeLast();
      }

      try {
        String parseStingExpress = '';

        for (KeyPress element in _express) {
          String value = element.value;
          String type = element.type;
          String lastValue = value.substring(element.value.length - 1);

          // Check last  just decimal sera
          if (type == AppConst.keyNum && value == AppConst.decimalSerpa) {
            element.value = '0';
          }
          if (type == AppConst.keyNum && lastValue == AppConst.decimalSerpa) {
            element.value += '0';
          }

          parseStingExpress += element.value;
        }

        // Required by pud
        Expression exp = expressCalculator.parse(parseStingExpress);

        _result = exp.evaluate(EvaluationType.REAL, ContextModel());
      } catch (e) {
        _resultError = true;
        return;
      }

      // If no error will run here & add history
      _resultError = false;

      if (!_resultError) {
        _expressHistory.add(ExpressHistory(
          express: [..._express],
          result: _result,
          timeInit: DateTime.now(),
        ));
      }

      emit(currentState.copyWith(
        express: _express,
        expressHistory: _expressHistory,
        result: _result,
        resultError: _resultError,
        wasEqualPressBefore: _wasEqualPressBefore,
      ));
      break;
  }
}
