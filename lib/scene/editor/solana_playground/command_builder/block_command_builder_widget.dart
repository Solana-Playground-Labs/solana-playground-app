import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'command_builder_widget.dart';
import 'command_builder_draggable.dart';
import 'block_command_builder_cubit.dart';

class BlockCommandBuilderWidget extends CubitWidget<BlockCommandBuilderCubit, BlockCommandBuilderState> {
  final BlockCommandBuilder builder;

  BlockCommandBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BlockCommandBuilderState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final builder = state.commands[index];

        return CommandBuilderDraggable(
          builder: builder,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 20),
                  child: Text("${index + 1}", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.end),
                ),
              ),
              Flexible(
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      context.read<CodeEditorCubit>().focus(builder);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CommandBuilderWidget(builder: builder),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: state.commands.length),
    );
  }

  @override
  cubit(BuildContext context) => BlockCommandBuilderCubit(builder);
}
