/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:base_x/base_x.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana/solana.dart';

import '../sp_runtime.dart';

Future<void> executePrintCommand(
  SPRuntime runtime,
  PrintCommand printCommand,
) async {
  final r = await runtime.calculate(printCommand.expression);

  if (r is List) {
    runtime.console.write(
      r.map((e) {
        if (e is List) {
          final encoder = BaseXCodec('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz');
          return "$e - ${encoder.encode(Uint8List.fromList(List.castFrom(e)))}";
        }

        return e;
      }).join(" "),
    );
  } else {
    runtime.console.write(r.toString());
  }
}
