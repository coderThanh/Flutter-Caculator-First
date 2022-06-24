class KeyPress {
  late String type;
  late String value;

  KeyPress({required this.type, required this.value});

  KeyPress copyWith({String? type, String? value}) {
    return KeyPress(type: type ?? this.type, value: value ?? this.value);
  }
}
