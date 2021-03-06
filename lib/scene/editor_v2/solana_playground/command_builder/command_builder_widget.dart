/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/comment/comment_command_builder_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/pda/create_spl_associated_token_account_builder_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/sign/sign_command_builder_widget.dart';
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
  WaitTransactionConfirmationCommandBuilder: (context, builder, meta) =>
      WaitTransactionCommandBuilderWidget(builder: builder, metaInfo: meta),
  GetRecentBlockHashCommandBuilder: (context, builder, meta) =>
      GetRecentBlockHashCommandBuilderWidget(builder: builder, metaInfo: meta),
  ImportKeypairFromStorageCommandBuilder: (context, builder, meta) =>
      ImportWalletCommandBuilderWidget(builder: builder, metaInfo: meta),
  MakeSimpleTransactionBuilder: (context, builder, meta) =>
      MakeSimpleTransactionWidget(builder: builder, metaInfo: meta),
  MakeKeyPairCommandBuilder: (context, builder, meta) =>
      MakeKeypairCommandBuilderWidget(builder: builder, metaInfo: meta),
  CommentCommandBuilder: (context, builder, meta) =>
      CommentCommandBuilderWidget(builder: builder, metaInfo: meta),
  SignCommandBuilder: (context, builder, meta) =>
      SignCommandBuilderWidget(builder: builder, metaInfo: meta),
  CreateSplAssociatedTokenAccountCommandBuilder: (context, builder, meta) =>
      CreateSPLAssociatedTokenAccountBuilderWidget(builder: builder, metaInfo: meta),
  GenerateKeypairCommandBuilder: (context, builder, meta) =>
      GenerateKeypairCommandBuilderWidget(builder: builder, metaInfo: meta),
  FindProgramAddressCommandBuilder: (context, builder, meta) =>
      GenerateKeypairCommandBuilderWidget(builder: builder, metaInfo: meta),
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
