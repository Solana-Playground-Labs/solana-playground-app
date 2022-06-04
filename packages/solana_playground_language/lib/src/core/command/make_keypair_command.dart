/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'make_keypair_command.builder.dart';

@CommandBuildable()
class MakeKeyPairCommand extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final ExpressionBuilder publicKey;

  @CommandPropertyBuildable()
  final ExpressionBuilder privateKey;

  const MakeKeyPairCommand({
    required this.variable,
    required this.publicKey,
    required this.privateKey,
  });

  @override
  List<Object> get props => [variable, publicKey, privateKey];

  factory MakeKeyPairCommand.fromJson(Map<String, dynamic> json) =>
      _$MakeKeyPairCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MakeKeyPairCommandToJson(this);

  @override
  MakeKeyPairCommandBuilder asBuilder() =>
      _$MakeKeyPairCommandToBuilder(this);
}
