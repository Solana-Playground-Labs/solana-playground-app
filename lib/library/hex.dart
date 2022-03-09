import 'dart:typed_data';

import 'package:solana_playground_app/library/list.dart';

class Hex {
  static String fromList(Uint8List data) {
    return data.map((e) => e.toRadixString(16)).join();
  }

  static Uint8List fromString(String data) {
    // if (data.length % 2 != 0) {
    //   data = data + "0";
    // }
    return Uint8List.fromList(
        data.every(2).map((e) => int.parse(e, radix: 16)).toList());
  }
}
