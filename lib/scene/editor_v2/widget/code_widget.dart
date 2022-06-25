/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/block_command_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class CodeWidget extends StatelessWidget {
  const CodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        color: theme.backgroundColor,
        child: BlocBuilder<CodeEditorCubit, CodeEditorState>(
          buildWhen: (p, n) => p.currentScript != n.currentScript,
          builder: (context, state) {
            if (state.currentScript?.blockCommandBuilder == null) {
              return const Center(child: Text("Empty"));
            }
            return CustomScrollView(
              slivers: [
                BlockCommandBuilderWidget(
                    builder: state.currentScript!.blockCommandBuilder),
                const SliverToBoxAdapter(child: SizedBox(height: 500)),
              ],
            );
          },
        ),
      ),
    );
  }
}
