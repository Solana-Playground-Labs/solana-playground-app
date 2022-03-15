/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

typedef StatementWidgetBuilder = Widget Function(BuildContext context, bool isFocused);

@Deprecated("Old code")
class StatementBuilderFocus extends StatelessWidget {
  final CommandBuilder commandBuilder;
  final StatementWidgetBuilder builder;

  const StatementBuilderFocus({Key? key, required this.commandBuilder, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      buildWhen: (p, n) => p.focusBuilder != n.focusBuilder,
      builder: (context, state) {
        return builder(context, state.focusBuilder == commandBuilder);
      },
    );
  }
}