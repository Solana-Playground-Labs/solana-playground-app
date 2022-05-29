/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

import '../sp_runtime.dart';

// Future<dynamic> calculateJsonValue(
//   SPRuntime runtime,
//   JsonValue jsonValue,
// ) async {
//   print(jsonValue);
//   return await _recursiveCalculate(runtime, jsonValue.data);
// }
//
// Future<dynamic> _recursiveCalculate(
//   SPRuntime runtime,
//   dynamic data,
// ) async {
//   if (data is List) {
//     return await Future.wait(data.map((e) => _recursiveCalculate(runtime, e)));
//   } else if (data is Map) {
//     Map r = {};
//     for (var key in data.keys) {
//       r[key] = await _recursiveCalculate(runtime, data[key]);
//     }
//     return r;
//   } else if (data is Expression) {
//     return await runtime.calculate(data);
//   } else {
//     throw Exception("Invalid value '$data'");
//   }
// }
