/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/lib.dart';

import '../../../editor_v2.dart';

class WaitTransactionCommandBuilderWidget extends StatelessWidget {
  final CommandBuilderMetaInfo? metaInfo;
  final WaitTransactionConfirmationCommandBuilder builder;

  const WaitTransactionCommandBuilderWidget(
      {Key? key, required this.builder, this.metaInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ComponentHeader(
      icon: SvgPicture.asset(SPIcons.waiting),
      name: commandHeaderFormatter("Wait transaction confirmation ", metaInfo),
      trailing: CommandBuilderAction(builder: builder),
      content: Row(
        children: [
          Text(
            "Transaction id: ",
            style: theme.textTheme.bodyText1,
          ),
          ExpressionBuilderWidget(builder: builder.transaction),
        ],
      ),
    );
  }
}
