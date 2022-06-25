/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/lib.dart';

class SignCommandBuilderWidget extends StatelessWidget {
  final SignCommandBuilder builder;
  final CommandBuilderMetaInfo? metaInfo;

  const SignCommandBuilderWidget({
    Key? key,
    this.metaInfo,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Component(
      header: ComponentHeader(
        icon: SvgPicture.asset(SPIconAssets.sign),
        name: commandHeaderFormatter("Sign transaction", metaInfo),
        trailing: CommandBuilderAction(builder: builder),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text("Variable: ", style: theme.textTheme.bodyText1),
                TextFieldBuilderWidget<SignCommandBuilder>(
                  style: SPLabelStyle.orange,
                  adapter: TextFieldBuilderAdapter<SignCommandBuilder>(
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
                Text("Transaction: ", style: theme.textTheme.bodyText1),
                ExpressionBuilderWidget(builder: builder.transaction),
              ],
            ),
          ],
        ),
      ),
      body: [
        ExpressionBuilderWidget(
          builder: builder.signers,
          metaData: ExpressionMetaDataList(
            title: "Add signer",
            singleBox: true,
            onInsert: () {
              return ExpressionBuilder.withVariable();
            },
          ),
        ),
      ],
    );
  }
}
