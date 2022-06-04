/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'submit_simple_transaction_cubit.dart';

class SubmitSimpleTransactionWidget extends CubitWidget<
    SubmitSimpleTransactionCubit, SubmitSimpleTransactionState> {
  final MakeSimpleTransactionBuilder builder;
  final CommandBuilderMetaInfo? metaInfo;

  SubmitSimpleTransactionWidget({Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, SubmitSimpleTransactionState state) {
    return Component(
      header: ComponentHeader(
        icon: SvgPicture.asset(SPIcons.submitTransaction),
        name: commandHeaderFormatter("Make transaction", metaInfo),
        trailing: CommandBuilderAction(builder: builder),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Variable: "),
            Flexible(
              child: IntrinsicWidth(
                child: VariableInputWidget(
                  controller: context.read<SubmitSimpleTransactionCubit>().variable,
                ),
              ),
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
  SubmitSimpleTransactionCubit cubit(BuildContext context) =>
      SubmitSimpleTransactionCubit(builder);
}
