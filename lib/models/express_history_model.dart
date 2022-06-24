import 'keypress_model.dart';

class ExpressHistory {
  late List<KeyPress> express;
  late double result;
  late DateTime timeInit;

  ExpressHistory({
    required this.express,
    required this.result,
    required this.timeInit,
  });

  ExpressHistory copyWith({
    List<KeyPress>? express,
    double? result,
    DateTime? timeInit,
  }) {
    // Copy deep
    List<KeyPress> _newExpress = [];

    if (express == null) {
      this.express.map((item) => _newExpress.add(item.copyWith()));
    } else {
      _newExpress = express;
    }

    return ExpressHistory(
        express: _newExpress,
        result: result ?? this.result,
        timeInit: this.timeInit);
  }
}
