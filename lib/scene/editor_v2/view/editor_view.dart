/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/runtime_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/widget/widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class EditorView extends StatelessWidget {
  final packageBuilder = PackageBuilder(
    name: "Transfer",
    packageType: PackageType.application,
    scriptBuilders: [
      ScriptBuilder(
        name: "Main",
        blockCommandBuilder: BlockCommandBuilder(
          commands: [],
        ),
      ),
    ],
  );

  EditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CodeEditorCubit>(
          create: (_) => CodeEditorCubit(packageBuilder),
        ),
        BlocProvider<RuntimeCubit>(
          create: (_) => RuntimeCubit(packageBuilder, context.read()),
        ),
        BlocProvider<PackageNameCubit>(
          create: (_) => PackageNameCubit(packageBuilder),
        )
      ],
      child: Scaffold(
        body: Column(
          children: [
            const EditorAppBar(),
            Expanded(
              child: Row(
                children: const [
                  ToolsWidget(),
                  VerticalDivider(width: 1),
                  Expanded(child: CodeWidget())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
