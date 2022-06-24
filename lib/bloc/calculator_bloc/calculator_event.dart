part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculatorEventKeyPress extends CalculatorEvent {
  final KeyPress keyPress;
  const CalculatorEventKeyPress({required this.keyPress});

  @override
  List<Object> get props => [keyPress];
}

class CalculatorEventRestore extends CalculatorEvent {
  final List<KeyPress> express;
  final double result;
  final DateTime timeInit;

  const CalculatorEventRestore(
      {required this.express, required this.result, required this.timeInit});

  @override
  List<Object> get props => [express, result, timeInit];
}
