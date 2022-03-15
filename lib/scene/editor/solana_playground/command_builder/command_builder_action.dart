/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'block_command_builder_cubit.dart';

class CommandBuilderAction extends StatelessWidget {
  final CommandBuilder builder;

  CommandBuilderAction({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => context.read<BlockCommandBuilderCubit>().remove(builder),
          child: const Text("Delete"),
        ),
        TextButton(
          onPressed: () => context.read<BlockCommandBuilderCubit>().moveUp(builder),
          child: const Text("Up"),
        ),
        TextButton(
          onPressed: () => context.read<BlockCommandBuilderCubit>().moveDown(builder),
          child: const Text("Down"),
        ),
      ],
    );
  }
}
