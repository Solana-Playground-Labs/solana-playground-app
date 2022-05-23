/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/meta_value/list/list_element_action.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import '../bool/bool_meta_value_widget.dart';
import 'account_meta_value_builder_cubit.dart';

class AccountMetaValueBuilderWidget extends CubitWidget<
    AccountMetaValueBuilderCubit, AccountMetaValueBuilderState> {
  final AccountMetaValueBuilder builder;

  AccountMetaValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, AccountMetaValueBuilderState state) {
    final theme = Theme.of(context);

    return ListElementInlineAction(
      builder: builder.builder.data,
      content: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                    child: ExpressionBuilderWidget(builder: builder.pubkey)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ExpressionBuilderWidget(
            builder: builder.isWritable,
            metaValueInfo: const MetaValueInfo(
              isMultiple: false,
              metaType: BoolMetaValueBuilder,
            ),
          ),
          const SizedBox(width: 8),
          ExpressionBuilderWidget(
            builder: builder.isSigner,
            metaValueInfo: const MetaValueInfo(
              isMultiple: false,
              metaType: BoolMetaValueBuilder,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  AccountMetaValueBuilderCubit cubit(BuildContext context) =>
      AccountMetaValueBuilderCubit(builder);
}
