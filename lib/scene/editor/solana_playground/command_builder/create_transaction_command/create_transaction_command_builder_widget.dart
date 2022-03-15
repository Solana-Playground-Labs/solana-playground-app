/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

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
              Flexible(
                child: IntrinsicWidth(
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
              Flexible(
                  child: ExpressionBuilderWidget(
                      label: "Recent block hash",
                      builder: builder.recentBlockhash)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Fee payer:", style: theme.textTheme.bodyText1),
              const SizedBox(width: 8),
              Flexible(
                child: ExpressionBuilderWidget(
                  label: "Fee payer",
                  builder: builder.feePayer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text("Signers:", style: theme.textTheme.bodyText1),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ExpressionBuilderWidget(
                  builder: builder.signers,
                  metaValueInfo: const MetaValueInfo(
                    isMultiple: true,
                    metaType: SignerMetaValueBuilder,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text("Instructions:", style: theme.textTheme.bodyText1),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ExpressionBuilderWidget(
                  builder: builder.instructions,
                  metaValueInfo: const MetaValueInfo(
                    isMultiple: true,
                    metaType: TransactionInstructionMetaValueBuilder,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  CreateTransactionCommandBuilderCubit cubit(BuildContext context) =>
      CreateTransactionCommandBuilderCubit(builder);
}
