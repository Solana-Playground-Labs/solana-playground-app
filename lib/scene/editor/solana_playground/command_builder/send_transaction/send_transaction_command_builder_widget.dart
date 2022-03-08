import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'send_transaction_command_builder_cubit.dart';

class SendTransactionCommandBuilderWidget extends CubitWidget<
    SendTransactionCommandBuilderCubit, SendTransactionCommandBuilderState> {
  final SendTransactionCommandBuilder builder;

  SendTransactionCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

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
          Text("  with result storage  ", style: theme.textTheme.bodyText1),
          Flexible(
            flex: 1,
            child: VariableInputWidget(
              controller: context
                  .read<SendTransactionCommandBuilderCubit>()
                  .variableInput,
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
