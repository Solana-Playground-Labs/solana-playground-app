/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
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
  final String addText;
  final bool isInline;

  ListMetaValueBuilderWidget({
    Key? key,
    this.isInline = false,
    required this.builder,
    required this.widgetBuilder,
    required this.onAdd,
    this.addText = "Insert",
    this.title,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ListMetaValueBuilderState state) {
    if (isInline) {
      return ComponentBody(
        icon: SvgPicture.asset(SPIcons.list),
        name: title ?? "List",
        content: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.builders.isNotEmpty)
                ...state.builders
                    .asMap()
                    .entries
                    .map((e) => [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: widgetBuilder(context, e.value, e.key),
                          ),
                          const Divider(height: 12, endIndent: 0)
                        ])
                    .reduce((value, element) => [...value, ...element])
                    .toList(),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InsertRow(onPressed: onAdd, title: addText),
              )
            ],
          ),
        ),
      );
    }

    return Component(
      header: title != null ? ComponentHeader(name: title!) : null,
      body: [
        ...state.builders
            .asMap()
            .entries
            .map((e) => widgetBuilder(context, e.value, e.key))
            .toList(),
        ComponentAction(
          content: Text(addText),
          onPressed: onAdd,
        )
      ],
    );
  }

  @override
  ListMetaValueBuilderCubit cubit(BuildContext context) =>
      ListMetaValueBuilderCubit(builder);
}
