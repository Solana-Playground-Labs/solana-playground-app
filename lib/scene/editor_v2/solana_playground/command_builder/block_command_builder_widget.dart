/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'command_builder_widget.dart';
import 'command_builder_draggable.dart';
import 'block_command_builder_cubit.dart';

class BlockCommandBuilderWidget
    extends CubitWidget<BlockCommandBuilderCubit, BlockCommandBuilderState> {
  final BlockCommandBuilder builder;

  BlockCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BlockCommandBuilderState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final builder = state.commands[index];

        return FractionallySizedBox(
          widthFactor: 0.9,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CommandBuilderWidget(builder: builder),
              ),
            ),
          ),
        );
      }, childCount: state.commands.length),
    );
  }

  @override
  cubit(BuildContext context) => BlockCommandBuilderCubit(builder);
}
