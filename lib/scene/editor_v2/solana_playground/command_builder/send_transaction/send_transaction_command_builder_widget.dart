/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../editor_v2.dart';
import 'send_transaction_command_builder_cubit.dart';

class SendTransactionCommandBuilderWidget extends CubitWidget<
    SendTransactionCommandBuilderCubit, SendTransactionCommandBuilderState> {
  final CommandBuilderMetaInfo? metaInfo;
  final SendTransactionCommandBuilder builder;

  SendTransactionCommandBuilderWidget({
    Key? key,
    required this.builder,
    this.metaInfo,
  }) : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    SendTransactionCommandBuilderState state,
  ) {
    final theme = Theme.of(context);
    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Send transaction  ", style: theme.textTheme.bodyText1),
          Flexible(
            flex: 1,
            child: ExpressionBuilderWidget(builder: builder.expressionBuilder),
          ),
          Text("  with id  ", style: theme.textTheme.bodyText1),
          Flexible(
            child: IntrinsicWidth(
              child: VariableInputWidget(
                controller: context
                    .read<SendTransactionCommandBuilderCubit>()
                    .variableInput,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SendTransactionCommandBuilderCubit cubit(BuildContext context) =>
      SendTransactionCommandBuilderCubit(builder);
}
