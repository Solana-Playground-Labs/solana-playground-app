/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/make_keypair/make_keypair_command_builder_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/submit_simple_transaction/submit_simple_transaction_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../editor_v2.dart';

typedef _MappingBuilder = Widget Function(
  BuildContext context,
  dynamic,
  CommandBuilderMetaInfo metaInfo,
);

class CommandBuilderMetaInfo {
  final int? index;

  const CommandBuilderMetaInfo({this.index});
}

final Map<Type, _MappingBuilder> _mapping = {
  PrintCommandBuilder: (context, builder, meta) =>
      PrintCommandBuilderWidget(builder: builder, metaInfo: meta),
  DeclareVariableCommandBuilder: (context, builder, meta) =>
      DeclareVariableCommandBuilderWidget(builder: builder, metaInfo: meta),
  SendTransactionCommandBuilder: (context, builder, meta) =>
      SendTransactionCommandBuilderWidget(builder: builder, metaInfo: meta),
  WaitConfirmationCommandBuilder: (context, builder, meta) =>
      WaitTransactionCommandBuilderWidget(builder: builder, metaInfo: meta),
  GetRecentBlockHashCommandBuilder: (context, builder, meta) =>
      GetRecentBlockHashCommandBuilderWidget(builder: builder, metaInfo: meta),
  ImportKeypairFromStorageCommandBuilder: (context, builder, meta) =>
      ImportWalletCommandBuilderWidget(builder: builder, metaInfo: meta),
  MakeSimpleTransactionBuilder: (context, builder, meta) =>
      SubmitSimpleTransactionWidget(builder: builder, metaInfo: meta),
  MakeKeyPairCommandBuilder: (context, builder, meta) =>
      MakeKeypairCommandBuilderWidget(builder: builder, metaInfo: meta),
};

class CommandBuilderWidget extends StatelessWidget {
  final CommandBuilderMetaInfo? metaInfo;
  final CommandBuilder builder;

  CommandBuilderWidget({Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final widget = _mapping[builder.runtimeType]?.call(
          context,
          builder,
          metaInfo ?? const CommandBuilderMetaInfo(),
        ) ??
        UnknownCommandWidget(builder: builder, metaInfo: metaInfo);

    return widget;
  }
}
