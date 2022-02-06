import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statements_builder_cubit.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

import 'statement_builder/statements_builder_widget.dart';

class CodeEditorPanel extends StatelessWidget {
  const CodeEditorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EditorTheme.of(context).background3,
      child: GestureDetector(
          onTap: () {
            context.read<CodeEditorCubit>().unfocus();
          },
          child: const CustomScrollView(
            slivers: [
              StatementsBuilderWidget(),
            ],
          )),
    );
  }
}
