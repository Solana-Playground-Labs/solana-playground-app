/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'declare_variable_command_builder_cubit.dart';

class DeclareVariableCommandBuilderWidget extends CubitWidget<
    DeclareVariableCommandBuilderCubit, DeclareVariableCommandBuilderState> {
  final DeclareVariableCommandBuilder builder;

  DeclareVariableCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    DeclareVariableCommandBuilderState state,
  ) {
    final theme = Theme.of(context);
    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Declare", style: theme.textTheme.bodyText1),
          const SizedBox(width: 12),
          Flexible(
            flex: 1,
            child: IntrinsicWidth(
              child: VariableInputWidget(
                controller: context
                    .read<DeclareVariableCommandBuilderCubit>()
                    .variableInputController,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text("with", style: theme.textTheme.bodyText1),
          const SizedBox(width: 12),
          Flexible(
            flex: 1,
            child: ExpressionBuilderWidget(builder: builder.expressionBuilder),
          ),
        ],
      ),
    );
  }

  @override
  DeclareVariableCommandBuilderCubit cubit(BuildContext context) =>
      DeclareVariableCommandBuilderCubit(builder);
}
