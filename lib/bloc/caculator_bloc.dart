import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/express_history_model.dart';
import '../models/keypress_model.dart';

part 'caculator_event.dart';
part 'caculator_state.dart';

class CaculatorBloc extends Bloc<CaculatorEvent, CaculatorState> {
  CaculatorBloc() : super(const CaculatorInitial()) {
    on<CaculatorEventLoadded>((event, emit) {
      emit(CaculatorLoadded());
    });
    on<CaculatorEventNumber>((event, emit) {
      print('Number event');
    });
    on<CaculatorEventOperator>((event, emit) {
      print('Operator event');
    });
    on<CaculatorEventAction>((event, emit) {
      print('Action event');
    });
  }
}
