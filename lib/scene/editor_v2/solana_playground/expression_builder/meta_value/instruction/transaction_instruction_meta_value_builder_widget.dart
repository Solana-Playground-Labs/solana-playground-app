/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/common/inline_builder.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';

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
    return Component(
      header: ComponentHeader(
        name: index == null ? "Transaction" : "Transaction #$index",
        trailing: MetaListExtraActions(
          builder: builder.builder,
          actions: (_) {
            return [
              ListAction(
                child: (builder.condition.valueBuilder
                            is ConstantValueBuilder &&
                        (builder.condition.valueBuilder as ConstantValueBuilder)
                                .value ==
                            "true")
                    ? const Text("Show condition")
                    : const Text("Hide condition"),
                onTap: () {
                  if (builder.condition.valueBuilder is ConstantValueBuilder &&
                      (builder.condition.valueBuilder as ConstantValueBuilder)
                              .value ==
                          "true") {
                    builder.condition.valueBuilder =
                        ConditionalValueBuilder.empty();
                  } else {
                    builder.condition.valueBuilder =
                        ConstantValueBuilder(value: "true");
                  }
                },
              ),
            ];
          },
        ),
        content: Column(
          children: [
            Row(
              children: [
                const Text("Program ID: "),
                Flexible(
                  child: ExpressionBuilderWidget(builder: builder.programId),
                )
              ],
            ),
            const SizedBox(height: 8),
            InlineBuilder<ExpressionBuilder, ValueBuilder>(
              builder: builder.condition,
              data: (builder) => builder.valueBuilder,
              widgetBuilder: (context, state) {
                if (state is ConstantValueBuilder && state.value == "true") {
                  return Container();
                }
                return Row(
                  children: [
                    const Text("Condition: "),
                    Flexible(
                      child: ExpressionBuilderWidget(
                        builder: builder.condition,
                        changeable: false,
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: [
        ExpressionBuilderWidget(
          metaValueView: const MetaValueListView(
            title: "Keys",
            isInline: true,
            child: MetaValueElementView(
              metaType: AccountMetaValueBuilder,
            ),
          ),
          builder: builder.keys,
        ),
        ExpressionBuilderWidget(
          isInline: false,
          builder: builder.data,
        ),
      ],
    );
  }

  @override
  TransactionInstructionMetaValueBuilderCubit cubit(BuildContext context) =>
      TransactionInstructionMetaValueBuilderCubit(builder);
}
