/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:convert';
import 'dart:typed_data';

import 'package:base_x/base_x.dart';
import 'package:solana/encoder.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/helper.dart';

import '../sp_runtime.dart';

Future<dynamic> calculateBinaryValue(
  SPRuntime runtime,
  BinaryValue binaryValue,
) async {
  final List<Uint8List> rawData = List.castFrom(
    await runtime.calculate(binaryValue.data),
  );

  final data = rawData.expand((element) => element).toList();
  return Uint8List.fromList(data);
}

Future<dynamic> calculateByteValue(
  SPRuntime runtime,
  ByteValue binaryValue,
) async {
  final int value = await runtime.calculate(binaryValue.expression);
  final data = ByteData(binaryValue.length);
  switch (binaryValue.length) {
    case 1:
      data.setUint8(0, value);
      break;
    case 2:
      data.setInt16(0, value, Endian.little);
      break;
    case 4:
      data.setInt32(0, value, Endian.little);
      break;
    case 8:
      data.setInt64(0, value, Endian.little);
      break;
    default:
      throw Exception(
        "Invalid length '${binaryValue.length}'. Available length: 1, 2, 4 and 8 byte",
      );
  }

  return data.buffer.asUint8List();
}

Future<dynamic> calculateHexValue(
  SPRuntime runtime,
  HexValue binaryValue,
) async {
  var value = await runtime.calculate(binaryValue.expression);
  if (value is! String) {
    throw Exception("Expected 'String', but receive '${value.runtimeType}'");
  }

  if (value.length % 2 != 0) {
    value = value + "0";
  }
  return Uint8List.fromList(value.every(2).map((e) => int.parse(e, radix: 16)).toList());
}

Future<dynamic> calculateStringByteValue(
  SPRuntime runtime,
  StringByteValue binaryValue,
) async {
  var value = await runtime.calculate(binaryValue.expression);
  if (value is! String) {
    throw Exception("Expected 'String', but receive '${value.runtimeType}'");
  }

  switch (binaryValue.base) {
    case 58:
      final base58 = BaseXCodec('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz');
      return base58.decode(value);
    case 64:
      final base64 = BaseXCodec('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/');
      return base64.decode(value);
    default:
      throw Exception('Invalid base value (${binaryValue.base}). Available base value: 58 and 64');
  }
}
