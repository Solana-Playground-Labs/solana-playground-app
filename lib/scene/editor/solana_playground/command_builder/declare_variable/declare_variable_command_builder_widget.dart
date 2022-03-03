import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
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
        children: [
          Text("Declare", style: theme.textTheme.bodyText1),
          const SizedBox(width: 12),
          Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus) context.read<CodeEditorCubit>().focus(builder);
            },
            child: IntrinsicWidth(
              child: SPLabel(
                style: SPLabelStyle.orange,
                child: TextField(
                  controller: context
                      .read<DeclareVariableCommandBuilderCubit>()
                      .variableInputController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                  decoration: SPTextField.compactInputDecoration
                      .copyWith(hintText: "Variable"),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text("with", style: theme.textTheme.bodyText1),
          const SizedBox(width: 12),
          ExpressionBuilderWidget(builder: builder.expressionBuilder),
        ],
      ),
    );
  }

  @override
  DeclareVariableCommandBuilderCubit cubit(BuildContext context) =>
      DeclareVariableCommandBuilderCubit(builder);
}
