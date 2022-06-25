/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class CreateSPLAssociatedTokenAccountBuilderWidget extends StatelessWidget {
  final CommandBuilderMetaInfo? metaInfo;
  final CreateSplAssociatedTokenAccountCommandBuilder builder;

  const CreateSPLAssociatedTokenAccountBuilderWidget({
    Key? key,
    this.metaInfo,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ComponentHeader(
      icon: SvgPicture.asset(SPIconAssets.pda),
      name: commandHeaderFormatter("Create associated token address", metaInfo),
      trailing: CommandBuilderAction(builder: builder),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("Variable: ", style: theme.textTheme.bodyText1),
              TextFieldBuilderWidget<CreateSplAssociatedTokenAccountCommandBuilder>(
                style: SPLabelStyle.orange,
                adapter: TextFieldBuilderAdapter<CreateSplAssociatedTokenAccountCommandBuilder>(
                  builder: builder,
                  getTextBuilder: (builder) => builder.variable,
                  setTextBuilder: (builder, value) => builder.variable = value,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Address: ", style: theme.textTheme.bodyText1),
              ExpressionBuilderWidget(builder: builder.baseAddress),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Mint address: ", style: theme.textTheme.bodyText1),
              ExpressionBuilderWidget(builder: builder.mintAddress),
            ],
          ),
        ],
      ),
    );
  }
}
