/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import 'instruction_value_builder_cubit.dart';

class InstructionValueBuilderWidget extends CubitWidget<
    InstructionValueBuilderCubit, InstructionValueBuilderState> {
  final ExpressionMetaDataNode? metaData;
  final InstructionValueBuilder builder;

  InstructionValueBuilderWidget(
      {Key? key, required this.builder, this.metaData})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, InstructionValueBuilderState state) {
    return Component(
      header: ComponentHeader(
        name: metaData?.index == null
            ? "Transaction"
            : "Transaction #${metaData!.index! + 1}",
        trailing: metaData?.index != null
            ? ListValueActions(
                builder: builder,
                actions: (_) {
                  return [
                    ConditionalWrapperAction.asListAction(context, builder),
                  ];
                },
              )
            : null,
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
          ],
        ),
      ),
      body: [
        ExpressionBuilderWidget(
          builder: builder.keys,
          metaData: ExpressionMetaDataList(
            title: "Keys",
            singleBox: true,
            onInsert: () => ExpressionBuilder(
              valueBuilder: AccountValueBuilder(
                isSigner: ExpressionBuilder.withBool(),
                isWritable: ExpressionBuilder.withBool(),
                pubkey: ExpressionBuilder.withConstantValue(),
              ),
            ),
            child: const ExpressionMetaDataNode(inline: false),
          ),
        ),
        ExpressionBuilderWidget(
          metaData: const ExpressionMetaDataNode(inline: false),
          builder: builder.data,
        ),
      ],
    );
  }

  @override
  InstructionValueBuilderCubit cubit(BuildContext context) =>
      InstructionValueBuilderCubit(builder);
}
