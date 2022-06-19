part of 'caculator_bloc.dart';

abstract class CaculatorEvent extends Equatable {
  const CaculatorEvent();

  @override
  List<Object> get props => [];
}

class CaculatorEventLoadded extends CaculatorEvent {}

class CaculatorEventOperator extends CaculatorEvent {}

class CaculatorEventNumber extends CaculatorEvent {}

class CaculatorEventAction extends CaculatorEvent {}
