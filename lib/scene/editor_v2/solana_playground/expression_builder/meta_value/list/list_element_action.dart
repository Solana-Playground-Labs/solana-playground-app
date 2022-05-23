/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ListElementAction extends StatelessWidget {
  final dynamic builder;

  const ListElementAction({Key? key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().remove(builder);
          },
          icon: const Icon(Icons.remove_circle_outline),
          color: Colors.grey,
          tooltip: "Remove",
        ),
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().moveUp(builder);
          },
          icon: const Icon(Icons.arrow_circle_up_rounded),
          color: Colors.blue,
          tooltip: "Move up",
        ),
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().moveDown(builder);
          },
          icon: const Icon(Icons.arrow_circle_down_rounded),
          color: Colors.blue,
          tooltip: "Move down",
        ),
      ],
    );
  }
}

class ListElementInlineAction extends StatelessWidget {
  final dynamic builder;
  final Widget content;

  const ListElementInlineAction({
    Key? key,
    required this.builder,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().remove(builder);
          },
          icon: const Icon(Icons.remove_circle_outlined),
          color: Colors.red,
          tooltip: "Remove",
        ),
        const SizedBox(width: 8),
        Expanded(child: content),
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().moveUp(builder);
          },
          icon: const Icon(Icons.arrow_circle_up_rounded),
          color: Colors.blue,
          tooltip: "Move up",
        ),
        SPIconButton(
          onPressed: () {
            context.read<ListMetaValueBuilderCubit>().moveDown(builder);
          },
          icon: const Icon(Icons.arrow_circle_down_rounded),
          color: Colors.blue,
          tooltip: "Move down",
        ),
      ],
    );
  }
}
