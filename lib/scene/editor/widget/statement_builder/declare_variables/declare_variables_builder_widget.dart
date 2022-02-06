import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/common/statement_builder_focus.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statements_builder_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variable/declare_variable_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variables/declare_variables_builder_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statement_builder_action.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class DeclareVariablesBuilderWidget extends StatelessWidget {
  final DeclareVariablesBuilder builder;

  DeclareVariablesBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeclareVariablesBuilderCubit(builder),
      child: Builder(
        builder: (context) => content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DeclareVariablesBuilderCubit, DeclareVariablesBuilderState>(
      builder: (context, state) => StatementBuilderFocus(
        statementBuilder: builder,
        builder: (context, isFocus) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Declare variables", style: theme.textTheme.headline6),
            for (var child in state.children)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DeclareVariableBuilderWidget(builder: child),
                    if (isFocus && state.children.length > 1)
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        constraints: const BoxConstraints(),
                        onPressed: () => builder.removeChild(child),
                        icon: const Icon(Icons.remove, color: Colors.red),
                      )
                  ],
                ),
              ),
            if (isFocus) StatementBuilderAction(builder: builder)
          ],
        ),
      ),
    );
  }
}
