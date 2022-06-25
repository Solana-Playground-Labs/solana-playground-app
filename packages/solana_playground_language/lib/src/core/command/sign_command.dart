/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sign_command.builder.dart';

@CommandBuildable()
class SignCommand extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final Expression signers;

  @CommandPropertyBuildable()
  final Expression transaction;

  const SignCommand(
      {required this.signers,
      required this.variable,
      required this.transaction});

  @override
  List<Object> get props => [signers, transaction, variable];

  factory SignCommand.fromJson(Map<String, dynamic> json) =>
      _$SignCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignCommandToJson(this);

  @override
  SignCommandBuilder asBuilder() => _$SignCommandToBuilder(this);
}
