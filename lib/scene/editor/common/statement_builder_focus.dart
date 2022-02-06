import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

typedef StatementWidgetBuilder = Widget Function(BuildContext context, bool isFocused);

class StatementBuilderFocus extends StatelessWidget {
  final StatementBuilder statementBuilder;
  final StatementWidgetBuilder builder;

  const StatementBuilderFocus({Key? key, required this.statementBuilder, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      buildWhen: (p, n) => p.focusedBuilder != n.focusedBuilder,
      builder: (context, state) {
        return builder(context, state.focusedBuilder == statementBuilder);
      },
    );
  }
}