/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'list_meta_value_builder_cubit.dart';

class ListMetaValueBuilderWidget
    extends CubitWidget<ListMetaValueBuilderCubit, ListMetaValueBuilderState> {
  final ListMetaValueBuilder builder;
  final Widget Function(BuildContext context, dynamic data, int index)
      widgetBuilder;
  final VoidCallback onAdd;
  final String? title;
  final bool isInline;

  ListMetaValueBuilderWidget({
    Key? key,
    this.isInline = false,
    required this.builder,
    required this.widgetBuilder,
    required this.onAdd,
    this.title,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ListMetaValueBuilderState state) {
    final theme = Theme.of(context);

    if (isInline) {
      return ComponentHeader(
        name: title ?? "List",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.builders.isNotEmpty)
              ...state.builders
                  .asMap()
                  .entries
                  .map((e) => [
                        widgetBuilder(context, e.value, e.key),
                        const Divider(height: 12, endIndent: 0)
                      ])
                  .reduce((value, element) => [...value, ...element])
                  .toList(),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onAdd,
                child: SizedBox(
                  height: 36,
                  child: Row(
                    children: [
                      const SizedBox(width: 6),
                      const Icon(Icons.add_circle_rounded, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        "Add",
                        style: theme.textTheme.button?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Component(
      header: ComponentHeader(name: title ?? "List"),
      body: [
        ...state.builders
            .asMap()
            .entries
            .map((e) => widgetBuilder(context, e.value, e.key))
            .toList(),
        ComponentAction(
          content: const Text("Add transaction"),
          onPressed: onAdd,
        )
      ],
    );
  }

  @override
  ListMetaValueBuilderCubit cubit(BuildContext context) =>
      ListMetaValueBuilderCubit(builder);
}
