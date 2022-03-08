import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'transaction_instruction_meta_value_builder_cubit.dart';

class TransactionInstructionMetaValueBuilderWidget extends CubitWidget<
    TransactionInstructionMetaValueBuilderCubit,
    TransactionInstructionMetaValueBuilderState> {
  final TransactionInstructionMetaValueBuilder builder;

  TransactionInstructionMetaValueBuilderWidget(
      {Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    TransactionInstructionMetaValueBuilderState state,
  ) {
    final theme = Theme.of(context);

    return SPCard(
      level: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Program id: ", style: theme.textTheme.bodyText1),
              ExpressionBuilderWidget(builder: builder.programId),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Keys:  ", style: theme.textTheme.bodyText1),
              ExpressionBuilderWidget(
                builder: ExpressionBuilder(
                  valueBuilder: JsonValueBuilder(data: builder.keys),
                ),
                metaValueInfo: const MetaValueInfo(
                  isMultiple: true,
                  metaType: AccountMetaValueBuilder,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  TransactionInstructionMetaValueBuilderCubit cubit(BuildContext context) =>
      TransactionInstructionMetaValueBuilderCubit(builder);
}
