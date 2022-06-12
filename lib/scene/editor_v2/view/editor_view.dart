/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/model/package_edit_controller.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/drag_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/runtime_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/widget/widget.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class EditorView extends StatelessWidget {
  final PackageEditController packageEditController;

  const EditorView({super.key, required this.packageEditController});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CodeEditorCubit>(
          create: (_) => CodeEditorCubit(packageEditController),
        ),
        BlocProvider<RuntimeCubit>(
          create: (_) => RuntimeCubit(
            packageEditController.currentBuilder,
            context.read(),
          ),
        ),
        BlocProvider<PackageNameCubit>(
          create: (_) => PackageNameCubit(packageEditController.currentBuilder),
        ),
        BlocProvider<DragCubit>(
          create: (_) => DragCubit(),
        ),
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
