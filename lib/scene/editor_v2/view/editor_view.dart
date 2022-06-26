/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:solana_playground_app/model/package_edit_controller.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/drag_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/runtime_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/widget/widget.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart' hide Builder;

class EditorView extends StatelessWidget {
  final PackageBuilder packageBuilder;

  const EditorView({super.key, required this.packageBuilder});

  @override
  Widget build(BuildContext context) {
    return Provider<PackageEditController>(
      create: (context) => PackageEditController(
        packageRepository: context.read(),
        currentBuilder: packageBuilder,
      ),
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CodeEditorCubit>(
              create: (_) => CodeEditorCubit(context.read<PackageEditController>()),
            ),
            BlocProvider<PackageNameCubit>(
              create: (_) => PackageNameCubit(packageBuilder),
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
      }),
    );
  }
}
