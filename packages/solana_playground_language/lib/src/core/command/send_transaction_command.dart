/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'send_transaction_command.builder.dart';

@CommandBuildable()
class SendTransactionCommand extends Command {
  @CommandPropertyBuildable()
  final Expression transaction;

  @CommandPropertyBuildable()
  final String variable;

  const SendTransactionCommand({
    required this.transaction,
    required this.variable,
  });

  @override
  List<Object> get props => [transaction, variable];

  factory SendTransactionCommand.fromJson(Map<String, dynamic> json) =>
      _$SendTransactionCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SendTransactionCommandToJson(this);

  @override
  CommandBuilder asBuilder() => _$SendTransactionCommandToBuilder(this);
}
