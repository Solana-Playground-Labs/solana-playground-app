/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import 'account_value_builder_cubit.dart';

class AccountValueBuilderWidget
    extends CubitWidget<AccountValueBuilderCubit, AccountValueBuilderState> {
  final AccountValueBuilder builder;

  AccountValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, AccountValueBuilderState state) {
    return Row(
      children: [
        Expanded(
          child: ExpressionBuilderWidget(builder: builder.pubkey),
        ),
        const SizedBox(width: 8),
        IntrinsicWidth(
          child: Tooltip(
            message: "Is writable",
            child: ExpressionBuilderWidget(
              metaData: const ExpressionMetaDataNode(
                title: "W",
                changeable: false,
              ),
              builder: builder.isWritable,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IntrinsicWidth(
          child: Tooltip(
            message: "Is signer",
            child: ExpressionBuilderWidget(
              metaData: const ExpressionMetaDataNode(
                title: "S",
                changeable: false,
              ),
              builder: builder.isSigner,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  AccountValueBuilderCubit cubit(BuildContext context) =>
      AccountValueBuilderCubit(builder);
}
