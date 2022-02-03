import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/common/statement_builder_focus.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variable/declare_variable_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variables/declare_variables_builder_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class DeclareVariablesBuilderWidget extends StatelessWidget {
  final DeclareVariablesBuilder declareVariablesBuilder;

  const DeclareVariablesBuilderWidget({Key? key, required this.declareVariablesBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeclareVariablesBuilderCubit(declareVariablesBuilder),
      child: Builder(
        builder: (context) => content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DeclareVariablesBuilderCubit, DeclareVariablesBuilderState>(
      builder: (context, state) => StatementBuilderFocus(
        statementBuilder: declareVariablesBuilder,
        builder: (context, isFocus) => Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              context.read<CodeEditorCubit>().focus(declareVariablesBuilder);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Declare variables", style: theme.textTheme.headline6),
                for (var declareVariableBuilder in state.children)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: DeclareVariableBuilderWidget(declareVariableBuilder: declareVariableBuilder),
                  ),
                if (isFocus) const Icon(Icons.add),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
