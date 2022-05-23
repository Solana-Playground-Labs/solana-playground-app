/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/meta_value/list/list_element_action.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import 'transaction_instruction_meta_value_builder_cubit.dart';

class TransactionInstructionMetaValueBuilderWidget extends CubitWidget<
    TransactionInstructionMetaValueBuilderCubit,
    TransactionInstructionMetaValueBuilderState> {
  final int? index;
  final TransactionInstructionMetaValueBuilder builder;

  TransactionInstructionMetaValueBuilderWidget({
    Key? key,
    this.index,
    required this.builder,
  }) : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    TransactionInstructionMetaValueBuilderState state,
  ) {
    final theme = Theme.of(context);

    return Component(
      header: ComponentHeader(
        name: index == null ? "Transaction" : "Transaction #$index",
        trailing: ListElementAction(builder: builder.builder.data),
        content: Row(
          children: [
            const Text("Program ID: "),
            ExpressionBuilderWidget(builder: builder.programId)
          ],
        ),
      ),
      body: [
        ExpressionBuilderWidget(
          metaValueInfo: const MetaValueInfo(
            title: "Keys",
            isMultiple: true,
            isInline: true,
            metaType: AccountMetaValueBuilder,
          ),
          builder: ExpressionBuilder(
            valueBuilder: JsonValueBuilder(data: builder.keys),
          ),
        )
      ],
    );
  }

  @override
  TransactionInstructionMetaValueBuilderCubit cubit(BuildContext context) =>
      TransactionInstructionMetaValueBuilderCubit(builder);
}
