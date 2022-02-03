import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/tools/inspector/declare_variable_inspector_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/tools/inspector/declare_variables_inspector_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class StatementBuilderInspectorWidget extends StatelessWidget {
  const StatementBuilderInspectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      buildWhen: (p, n) => p.focusedBuilder != n.focusedBuilder,
      builder: (context, state) {
        final statementBuilder = state.focusedBuilder;
        if (statementBuilder == null) return Container();
        return mapping(context, statementBuilder);
      },
    );
  }

  Widget mapping(BuildContext context, StatementBuilder builder) {
    Widget widget = Container();
    if (builder is DeclareVariableBuilder) {
      widget = DeclareVariableInspectorWidget(builder: builder);
    } else if (builder is DeclareVariablesBuilder) {
      widget = DeclareVariablesInspectorWidget(builder: builder);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("Inspector", style: Theme.of(context).textTheme.headline6),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: widget,
        )),
      ],
    );
  }
}
