/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

part 'make_simple_transaction.builder.dart';

@CommandBuildable()
class MakeSimpleTransaction extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final Expression recentBlockHash;

  @CommandPropertyBuildable()
  final Expression feePayer;

  @CommandPropertyBuildable()
  final Expression instructions;

  @CommandPropertyBuildable()
  final Expression signers;

  const MakeSimpleTransaction({
    required this.variable,
    required this.recentBlockHash,
    required this.feePayer,
    required this.instructions,
    required this.signers,
  });

  factory MakeSimpleTransaction.fromJson(Map<String, dynamic> json) =>
      _$MakeSimpleTransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MakeSimpleTransactionToJson(this);

  @override
  MakeSimpleTransactionBuilder asBuilder() => _$MakeSimpleTransactionToBuilder(this);

  @override
  List<Object?> get props => [
        variable,
        feePayer,
        instructions,
        signers,
        recentBlockHash,
      ];
}
