/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/scene/editor_v2/model/extra_action.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'block_command_builder_cubit.dart';

class CommandBuilderAction extends StatelessWidget {
  final CommandBuilder builder;
  final List<Widget> actions;
  final List<ExtraAction?> Function(BuildContext context)? extraActions;

  CommandBuilderAction({
    Key? key,
    required this.builder,
    this.actions = const [],
    this.extraActions,
  }) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...actions,
        SPIconButton(
          onPressed: () {
            context.read<BlockCommandBuilderCubit>().moveUp(builder);
          },
          icon: const Icon(Icons.arrow_circle_up_rounded),
          color: Colors.blue,
          tooltip: "Move up",
        ),
        SPIconButton(
          onPressed: () {
            context.read<BlockCommandBuilderCubit>().moveDown(builder);
          },
          icon: const Icon(Icons.arrow_circle_down_rounded),
          color: Colors.blue,
          tooltip: "Move down",
        ),
        const SizedBox(width: 4),
        ExtraActionWidget(
          actions: (context) => [
            ...?extraActions?.call(context),
            ExtraAction(
                child: const Text("Remove"),
                onTap: () =>
                    {context.read<BlockCommandBuilderCubit>().remove(builder)}),
          ],
        ),
      ],
    );
  }
}
