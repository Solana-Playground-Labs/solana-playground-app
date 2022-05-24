/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ListAction extends Equatable {
  final Widget child;
  final VoidCallback onTap;

  const ListAction({
    required this.child,
    required this.onTap,
  });

  @override
  List<Object> get props => [child, onTap];
}

class MetaListExtraActions extends StatelessWidget {
  final dynamic builder;
  final List<ListAction> Function(BuildContext context)? actions;

  const MetaListExtraActions({
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
        const SizedBox(width: 4),
        PopupMenuButton<ListAction>(
          splashRadius: 16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.more_vert_rounded, color: Colors.grey),
          itemBuilder: (context) {
            return [
              if (actions != null)
                ...actions!(context).map((e) {
                  return PopupMenuItem<ListAction>(
                    onTap: e.onTap,
                    child: e.child,
                  );
                }).toList(),
              PopupMenuItem<ListAction>(
                onTap: () =>
                    context.read<ListMetaValueBuilderCubit>().remove(builder),
                child: const Text("Remove"),
              ),
            ];
          },
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
