import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/get_recent_block_hash/get_recent_block_hash_command_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/send_transaction/send_transaction_command_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/wait_transaction_command/wait_transaction_command_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

typedef _MappingBuilder = Widget Function(BuildContext context, dynamic);

final Map<Type, _MappingBuilder> _mapping = {
  PrintCommandBuilder: (context, builder) =>
      PrintCommandBuilderWidget(builder: builder),
  DeclareVariableCommandBuilder: (context, builder) =>
      DeclareVariableCommandBuilderWidget(builder: builder),
  CreateTransactionCommandBuilder: (context, builder) =>
      CreateTransactionCommandBuilderWidget(builder: builder),
  SendTransactionCommandBuilder: (context, builder) =>
      SendTransactionCommandBuilderWidget(builder: builder),
  WaitConfirmationCommandBuilder: (context, builder) =>
      WaitTransactionCommandBuilderWidget(builder: builder),
  GetRecentBlockHashCommandBuilder: (context, builder) =>
      GetRecentBlockHashCommandBuilderWidget(builder: builder),
};

class CommandBuilderWidget extends StatelessWidget {
  final CommandBuilder builder;

  CommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final widget = _mapping[builder.runtimeType]?.call(context, builder) ??
        UnknownCommandWidget(builder: builder);

    return widget;
  }
}
