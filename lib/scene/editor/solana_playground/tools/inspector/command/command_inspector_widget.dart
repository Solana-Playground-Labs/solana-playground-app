import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'command_inspector_cubit.dart';

class CommandInspectorWidget
    extends CubitWidget<CommandInspectorCubit, CommandInspectorState> {
  final BlockCommandBuilder? blockCommandBuilder;
  final CommandBuilder builder;

  CommandInspectorWidget({
    Key? key,
    required this.builder,
    this.blockCommandBuilder,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, CommandInspectorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(builder.runtimeType.toString().replaceAll("Builder", "")),
        ),
        TextButton(
            onPressed: () {
              blockCommandBuilder?.update((commands) {
                commands.remove(builder);
              });
              context.read<CodeEditorCubit>().unfocus();
            },
            child: const Text("Remove")),
        TextButton(
            onPressed: () {
              final index =
                  blockCommandBuilder?.commands.indexOf(builder) ?? -1;
              if (index < 0) return;
              blockCommandBuilder?.commands.moveTo(builder, index - 1);
            },
            child: const Text("Move up")),
        TextButton(
            onPressed: () {
              final index =
                  blockCommandBuilder?.commands.indexOf(builder) ?? -1;
              if (index < 0) return;
              blockCommandBuilder?.commands.moveTo(builder, index + 1);
            },
            child: const Text("Move down")),
      ],
    );
  }

  @override
  CommandInspectorCubit cubit(BuildContext context) =>
      CommandInspectorCubit(builder);
}
