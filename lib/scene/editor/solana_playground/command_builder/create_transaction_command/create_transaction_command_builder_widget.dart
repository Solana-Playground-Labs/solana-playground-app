import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'create_transaction_command_builder_cubit.dart';

class CreateTransactionCommandBuilderWidget extends CubitWidget<
    CreateTransactionCommandBuilderCubit,
    CreateTransactionCommandBuilderState> {
  final CreateTransactionCommandBuilder builder;

  CreateTransactionCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
      BuildContext context, CreateTransactionCommandBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Create transaction", style: theme.textTheme.bodyText1),
              const SizedBox(width: 8),
              IntrinsicWidth(
                child: Focus(
                  onFocusChange: (hasFocused) {
                    if (hasFocused) {
                      context.read<CodeEditorCubit>().focus(builder);
                    }
                  },
                  child: VariableInputWidget(
                    controller: context
                        .read<CreateTransactionCommandBuilderCubit>()
                        .variableInput,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Recent block hash:", style: theme.textTheme.bodyText1),
              const SizedBox(width: 8),
              ExpressionBuilderWidget(builder: builder.recentBlockhash),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Fee payer:", style: theme.textTheme.bodyText1),
              const SizedBox(width: 8),
              ExpressionBuilderWidget(builder: builder.feePayer),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Signatures:", style: theme.textTheme.bodyText1),
              const SizedBox(width: 16),
              ExpressionBuilderWidget(
                builder: builder.signatures,
                metaValueInfo: const MetaValueInfo(
                  isMultiple: true,
                  metaType: SignaturePubkeyParsMetaValueBuilder,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Instructions:", style: theme.textTheme.bodyText1),
              const SizedBox(width: 16),
              ExpressionBuilderWidget(
                builder: builder.instructions,
                metaValueInfo: const MetaValueInfo(
                  isMultiple: true,
                  metaType: TransactionInstructionMetaValueBuilder,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  CreateTransactionCommandBuilderCubit cubit(BuildContext context) =>
      CreateTransactionCommandBuilderCubit(builder);
}
