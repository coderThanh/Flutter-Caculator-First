part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial();

  @override
  List<Object> get props => [];

  static List<KeyPress> get express => [];
  static List<ExpressHistory> get expressHistory => [];
  static double get result => 0;
  static bool get resultError => false;
  static bool get wasEqualPressBefore => false;
}

class CalculatorLoadded extends CalculatorState {
  final List<KeyPress> express;
  final List<ExpressHistory> expressHistory;
  final double result;
  final bool resultError;
  final bool wasEqualPressBefore;

  const CalculatorLoadded({
    required this.express,
    required this.expressHistory,
    required this.result,
    required this.resultError,
    required this.wasEqualPressBefore,
  });

  @override
  List<Object> get props => [
        express,
        expressHistory,
        result,
        resultError,
        wasEqualPressBefore,
      ];

  CalculatorLoadded copyWith({
    List<KeyPress>? express,
    List<ExpressHistory>? expressHistory,
    double? result,
    bool? resultError,
    bool? wasEqualPressBefore,
  }) {
    return CalculatorLoadded(
      express: express ?? List.from(this.express),
      expressHistory: expressHistory ?? List.from(this.expressHistory),
      result: result ?? this.result,
      resultError: resultError ?? this.resultError,
      wasEqualPressBefore: wasEqualPressBefore ?? this.wasEqualPressBefore,
    );
  }
}
