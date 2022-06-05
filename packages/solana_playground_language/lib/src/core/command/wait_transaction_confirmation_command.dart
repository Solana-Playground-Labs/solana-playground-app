/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'wait_transaction_confirmation_command.builder.dart';

@CommandBuildable()
class WaitTransactionConfirmationCommand extends Command {
  @CommandPropertyBuildable()
  final Expression transaction;

  const WaitTransactionConfirmationCommand({
    required this.transaction,
  });

  @override
  List<Object?> get props => [transaction];

  factory WaitTransactionConfirmationCommand.fromJson(
          Map<String, dynamic> json) =>
      _$WaitTransactionConfirmationCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$WaitTransactionConfirmationCommandToJson(this);

  @override
  WaitTransactionConfirmationCommandBuilder asBuilder() =>
      _$WaitTransactionConfirmationCommandToBuilder(this);
}
