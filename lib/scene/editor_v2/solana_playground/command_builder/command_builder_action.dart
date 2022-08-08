/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    return ResponsiveBuilder(
      builder: (context, info) {
        if (info.isMobile) {
          return ExtraActionWidget(actions: (BuildContext context) => mobileActions(context));
        } else {
          return Row(children: desktopActions(context));
        }
      },
    );
  }

  List<ExtraAction> mobileActions(BuildContext context) {
    return [
      ExtraAction(
        child: Row(
          children: const [
            Icon(Icons.arrow_circle_up_rounded),
            SizedBox(width: 4),
            Text("Move up"),
          ],
        ),
        onTap: () {
          context.read<BlockCommandBuilderCubit>().moveUp(builder);
        },
      ),
      ExtraAction(
        child: Row(
          children: const [
            Icon(Icons.arrow_circle_down_rounded),
            SizedBox(width: 4),
            Text("Move down"),
          ],
        ),
        onTap: () {
          context.read<BlockCommandBuilderCubit>().moveUp(builder);
        },
      ),
      if (extraActions != null) ...extraActions!.call(context).whereType(),
      ExtraAction(
          child: Row(
            children: const [
              Icon(Icons.remove_circle_outline),
              SizedBox(width: 4),
              Text("Remove"),
            ],
          ),
          onTap: () => {context.read<BlockCommandBuilderCubit>().remove(builder)}),
    ];
  }

  List<Widget> desktopActions(BuildContext context) {
    return [
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
              onTap: () => {context.read<BlockCommandBuilderCubit>().remove(builder)}),
        ],
      ),
    ];
  }
}
