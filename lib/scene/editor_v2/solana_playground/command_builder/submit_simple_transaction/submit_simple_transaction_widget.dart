/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'submit_simple_transaction_cubit.dart';

class SubmitSimpleTransactionWidget extends CubitWidget<
    SubmitSimpleTransactionCubit, SubmitSimpleTransactionState> {
  final SubmitSimpleTransactionBuilder builder;

  SubmitSimpleTransactionWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, SubmitSimpleTransactionState state) {
    return Component(
      header: ComponentHeader(
        icon: SvgPicture.asset(SPIcons.submitTransaction),
        name: "Submit transaction",
        trailing: CommandBuilderAction(builder: builder),
      ),
      body: [
        ExpressionBuilderWidget(
          builder: builder.instructions,
          metaValueView: const MetaValueListView(
            addText: "Add instruction",
            child: MetaValueElementView(
              metaType: TransactionInstructionMetaValueBuilder,
            ),
          ),
        ),
        ExpressionBuilderWidget(
          builder: builder.signers,
          metaValueView: const MetaValueListView(
            addText: "Insert signer",
            isInline: true,
          ),
        ),
      ],
    );
  }

  @override
  SubmitSimpleTransactionCubit cubit(BuildContext context) =>
      SubmitSimpleTransactionCubit(builder);
}
