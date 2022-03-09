import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValueBuilder extends ValueBuilder {
  Uint8List _data;

  BinaryValueBuilder({required Uint8List data}) : _data = data;

  Uint8List get data => _data;

  set data(Uint8List value) {
    _data = value;
    notifyListeners();
  }

  void update(void Function(Uint8List) callback) {
    callback(_data);
    notifyListeners();
  }

  @override
  BinaryValue build() {
    return BinaryValue(data: data);
  }

  @override
  ValueBuilder clone() {
    return BinaryValueBuilder(data: data);
  }
}
