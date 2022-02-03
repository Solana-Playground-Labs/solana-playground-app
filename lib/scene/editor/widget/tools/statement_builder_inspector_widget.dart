import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';

class StatementBuilderInspectorWidget extends StatelessWidget {
  const StatementBuilderInspectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      builder: (context, state) {
        final statementBuilder = state.focusedBuilder;
        if (statementBuilder == null) return Container();
        return Center(child: Text(statementBuilder.runtimeType.toString()));
      },
    );
  }
}
