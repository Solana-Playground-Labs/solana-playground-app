class SPMemory {
  final Map<String, dynamic> _data = {};

  dynamic read(String variable) {
    return _data[variable];
  }

  void write(String variable, dynamic value) {
    _data[variable] = value;
  }
}