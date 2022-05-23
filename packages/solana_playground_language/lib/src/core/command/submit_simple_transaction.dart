/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/command/submit_simple_transaction_builder.dart';

class SubmitSimpleTransaction extends Command {
  final Expression instructions;
  final Expression signers;

  const SubmitSimpleTransaction(
      {required this.instructions, required this.signers});

  factory SubmitSimpleTransaction.fromJson(Map<String, dynamic> json) {
    return SubmitSimpleTransaction(
        instructions: Expression.fromJson(json['instructions']),
        signers: Expression.fromJson(json['expression']));
  }

  @override
  Map<String, dynamic> toJson() => {
        "instructions": instructions.toJson(),
        "signers": signers.toJson(),
      };

  @override
  SubmitSimpleTransactionBuilder asBuilder() {
    return SubmitSimpleTransactionBuilder(
      instructions: instructions.asBuilder(),
      signers: signers.asBuilder(),
    );
  }

  @override
  List<Object?> get props => [instructions, signers];
}
