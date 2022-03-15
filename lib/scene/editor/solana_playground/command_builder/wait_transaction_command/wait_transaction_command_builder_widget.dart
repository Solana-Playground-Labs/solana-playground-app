/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_language/lib.dart';

class WaitTransactionCommandBuilderWidget extends StatelessWidget {
  final WaitConfirmationCommandBuilder builder;

  const WaitTransactionCommandBuilderWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Wait transaction confirmation ",
            style: theme.textTheme.bodyText1,
          ),
          Flexible(
            child: ExpressionBuilderWidget(builder: builder.expressionBuilder),
          ),
        ],
      ),
    );
  }
}
