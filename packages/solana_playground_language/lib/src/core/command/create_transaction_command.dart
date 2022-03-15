/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

import 'abstract_command.dart';

class CreateTransactionCommand extends Command {
  final String variable;
  final Expression signers;
  final Expression instructions;
  final Expression feePayer;
  final Expression recentBlockhash;

  const CreateTransactionCommand({
    required this.variable,
    required this.signers,
    required this.instructions,
    required this.feePayer,
    required this.recentBlockhash,
  });

  @override
  List<Object?> get props => [
        variable,
        signers,
        instructions,
        feePayer,
        recentBlockhash,
      ];

  factory CreateTransactionCommand.fromJson(Map<String, dynamic> json) {
    return CreateTransactionCommand(
      variable: json['variable'],
      signers: Expression.fromJson(json['signers']),
      instructions: Expression.fromJson(json['instructions']),
      feePayer: Expression.fromJson(json['feePayer']),
      recentBlockhash: Expression.fromJson(json['recentBlockhash']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "type": classType,
        'variable': variable,
        'signers': signers.toJson(),
        'instructions': instructions.toJson(),
        'feePayer': feePayer.toJson(),
        'recentBlockhash': recentBlockhash.toJson(),
      };

  @override
  CreateTransactionCommandBuilder asBuilder() {
    return CreateTransactionCommandBuilder(
      variable: variable,
      signers: signers.asBuilder(),
      instructions: instructions.asBuilder(),
      feePayer: feePayer.asBuilder(),
      recentBlockhash: recentBlockhash.asBuilder(),
    );
  }
}
