/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'make_simple_transaction_cubit.dart';

class MakeSimpleTransactionWidget extends CubitWidget<
    MakeSimpleTransactionCubit, MakeSimpleTransactionState> {
  final MakeSimpleTransactionBuilder builder;
  final CommandBuilderMetaInfo? metaInfo;

  MakeSimpleTransactionWidget({Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, MakeSimpleTransactionState state) {
    return Component(
      header: ComponentHeader(
        icon: SvgPicture.asset(SPIcons.submitTransaction),
        name: commandHeaderFormatter("Make transaction", metaInfo),
        trailing: CommandBuilderAction(builder: builder),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Variable: "),
                Flexible(
                  child: IntrinsicWidth(
                    child: VariableInputWidget(
                      controller:
                          context.read<MakeSimpleTransactionCubit>().variable,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Recent block hash: "),
                IntrinsicWidth(
                  child: ExpressionBuilderWidget(
                    builder: builder.recentBlockHash,
                    metaData: const ExpressionMetaDataNode(
                      allowTypes: TypeInspectorHelper.basicTypeList,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Fee payer: "),
                IntrinsicWidth(
                  child: ExpressionBuilderWidget(
                    builder: builder.feePayer,
                    metaData: const ExpressionMetaDataNode(
                      allowTypes: TypeInspectorHelper.basicTypeList,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: [
        ExpressionBuilderWidget(
          builder: builder.instructions,
          metaData: ExpressionMetaDataList(
              onInsert: () {
                return ExpressionBuilder(
                  valueBuilder: InstructionValueBuilder(
                    programId: ExpressionBuilder.withStringValue(),
                    keys: ExpressionBuilder.withList(),
                    data: ExpressionBuilder.withBinaryValue(),
                  ),
                );
              },
              child: const ExpressionMetaDataNode()),
        ),
      ],
    );
  }

  @override
  MakeSimpleTransactionCubit cubit(BuildContext context) =>
      MakeSimpleTransactionCubit(builder);
}
