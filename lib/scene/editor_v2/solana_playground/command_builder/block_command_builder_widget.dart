/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/drag_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'command_builder_widget.dart';
import 'block_command_builder_cubit.dart';

class BlockCommandBuilderWidget
    extends CubitWidget<BlockCommandBuilderCubit, BlockCommandBuilderState> {
  final BlockCommandBuilder builder;

  BlockCommandBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BlockCommandBuilderState blockCommandState) {
    return BlocBuilder<DragCubit, DragState>(
      builder: (context, dragState) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (dragState.isActive) {
              if (index % 2 == 0) {
                return FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: CommandDragTargetWidget(index: index),
                    ),
                  ),
                );
              }

              index = index ~/ 2;
            }

            final builder = blockCommandState.commands[index];

            // TODO: Remove duplicated code
            return FractionallySizedBox(
              widthFactor: getValueForScreenType<double>(
                context: context,
                mobile: 0.96,
                tablet: 0.90
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CommandBuilderWidget(
                      builder: builder,
                      metaInfo: CommandBuilderMetaInfo(index: index),
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: dragState.isActive
              ? blockCommandState.commands.length * 2 + 1
              : blockCommandState.commands.length,
        ),
      ),
    );
  }

  @override
  cubit(BuildContext context) => BlockCommandBuilderCubit(builder);
}

class CommandDragTargetWidget extends StatelessWidget {
  final int index;

  const CommandDragTargetWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<CommandBuilder>(
      onAcceptWithDetails: (drag) {
        context.read<BlockCommandBuilderCubit>().insertAt(index, drag.data);
      },
      builder: (context, candidateData, rejectedData) {
        var text = "Place holder";

        if (candidateData.isNotEmpty && candidateData.first is CommandBuilder) {
          text = "Paste";
        }

        return placeHolder(context, text);
      },
    );
  }

  Widget placeHolder(BuildContext context, String text) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 54,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        color: Colors.grey,
        child: Center(
          child: Text(text, style: theme.textTheme.caption),
        ),
      ),
    );
  }
}
