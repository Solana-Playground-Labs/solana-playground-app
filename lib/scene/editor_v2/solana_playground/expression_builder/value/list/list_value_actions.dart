/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ListValueActions extends StatelessWidget {
  final dynamic builder;
  final List<ExtraAction?> Function(BuildContext context)? actions;

  const ListValueActions({
    Key? key,
    this.builder,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SPIconButton(
          onPressed: () {
            context.read<ListValueBuilderCubit>().moveUp(builder);
          },
          icon: const Icon(Icons.arrow_circle_up_rounded),
          color: Colors.blue,
          tooltip: "Move up",
        ),
        SPIconButton(
          onPressed: () {
            context.read<ListValueBuilderCubit>().moveDown(builder);
          },
          icon: const Icon(Icons.arrow_circle_down_rounded),
          color: Colors.blue,
          tooltip: "Move down",
        ),
        const SizedBox(width: 4),
        ExtraActionWidget(
          actions: (context) => [
            ...?actions?.call(context),
            ExtraAction(
                child: const Text("Remove"),
                onTap: () =>
                    {context.read<ListValueBuilderCubit>().remove(builder)}),
          ],
        ),
      ],
    );
  }
}