part of 'caculator_bloc.dart';

abstract class CaculatorState extends Equatable {
  const CaculatorState();

  @override
  List<Object> get props => [];
}

class CaculatorInitial extends CaculatorState {
  const CaculatorInitial();

  @override
  List<Object> get props => [];
}

class CaculatorLoadded extends CaculatorState {
  List<KeyPress> express = [];
  List<ExpressHistory> expressHistory = [];
  double result = 0;
  bool resultError = false;
  bool wasEqualPressBefore = false;

  CaculatorLoadded({
    List<KeyPress>? express,
    List<ExpressHistory>? expressHistory,
    double? result,
    bool? resultError,
    bool? wasEqualPressBefore,
  }) {
    this.express = express ?? this.express;
    this.expressHistory = expressHistory ?? this.expressHistory;
    this.result = result ?? this.result;
    this.resultError = resultError ?? this.resultError;
    this.wasEqualPressBefore = wasEqualPressBefore ?? this.wasEqualPressBefore;
  }

  @override
  List<Object> get props => [
        express,
        expressHistory,
        result,
        resultError,
        wasEqualPressBefore,
      ];
}
