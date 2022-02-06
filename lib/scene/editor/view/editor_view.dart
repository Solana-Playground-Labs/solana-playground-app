import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statements_builder_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/code_editor_panel.dart';
import 'package:solana_playground_app/scene/editor/widget/left_panel.dart';
import 'package:solana_playground_app/scene/editor/widget/right_panel.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class EditorView extends StatelessWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EditorTheme(
      themeData: EditorThemeData(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CodeEditorCubit(ProgramBuilderImpl())),
        ],
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Transfer Demo"),
              backgroundColor: EditorTheme.of(context).appBarColor,
              actions: [
                Center(
                  child: Text(
                    "Devnet",
                    style: theme.textTheme.bodyText1?.copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                LeftPanel(),
                Expanded(child: CodeEditorPanel()),
                RightPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
