/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/request_recent_blockhash_command.dart';

class RequestRecentBlockhashBuilder extends CommandBuilder {
  String variable;

  RequestRecentBlockhashBuilder({required this.variable});

  @override
  RequestRecentBlockhash build() {
    return RequestRecentBlockhash(variable: variable);
  }

  @override
  CommandBuilder clone() {
    return RequestRecentBlockhashBuilder(variable: variable);
  }
}
