import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/editor/widget/bottom_toolbar.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';
import 'package:solana_playground_language/solana_playground_language.dart'
    hide Builder;

class EditorView extends StatelessWidget {
  final packageBuilder = SPPackageBuilder(
    packageType: PackageType.application,
    functionBuilders: [
      ScriptBuilder(
          name: "main",
          blockCommandBuilder: BlockCommandBuilder(
            commands: ListBuilder.empty(),
          ))
    ],
  );

  EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EditorTheme(
      themeData: EditorThemeData(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RuntimeCubit(packageBuilder)),
          BlocProvider(create: (context) => CodeEditorCubit(packageBuilder)),
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
                    style:
                        theme.textTheme.bodyText1?.copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      LeftPanel(),
                      Expanded(child: CodeEditorPanel()),
                      RightPanel(),
                    ],
                  ),
                ),
                const BottomToolBar(),
                const BottomPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
