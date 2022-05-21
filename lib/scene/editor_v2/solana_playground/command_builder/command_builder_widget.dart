/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../editor_v2.dart';

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
  ImportWalletCommandBuilder: (context, builder) =>
      ImportWalletCommandBuilderWidget(builder: builder),
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
