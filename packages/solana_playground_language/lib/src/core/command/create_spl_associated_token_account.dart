/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'create_spl_associated_token_account.builder.dart';

@CommandBuildable()
class CreateSplAssociatedTokenAccountCommand extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final Expression baseAddress;

  @CommandPropertyBuildable()
  final Expression mintAddress;

  const CreateSplAssociatedTokenAccountCommand(
      {required this.baseAddress,
      required this.variable,
      required this.mintAddress});

  @override
  List<Object> get props => [baseAddress, mintAddress, variable];

  factory CreateSplAssociatedTokenAccountCommand.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSplAssociatedTokenAccountCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CreateSplAssociatedTokenAccountCommandToJson(this);

  @override
  CreateSplAssociatedTokenAccountCommandBuilder asBuilder() =>
      _$CreateSplAssociatedTokenAccountCommandToBuilder(this);
}
