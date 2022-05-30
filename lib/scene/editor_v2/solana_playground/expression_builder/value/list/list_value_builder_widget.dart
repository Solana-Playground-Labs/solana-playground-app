/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/value/list/list_value_builder_cubit.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/lib.dart';

import '../../../../cubit/cubit.dart';
import '../../../../editor_v2.dart';
import '../../expression_builder_widget.dart';

class ListValueBuilderWidget
    extends CubitWidget<ListValueBuilderCubit, ListValueBuilderState> {
  final String? title;
  final Widget? icon;

  final ExpressionMetaDataList? metaData;
  final ListValueBuilder builder;

  ListValueBuilderWidget({
    Key? key,
    this.title,
    required this.builder,
    this.metaData,
    this.icon,
  }) : super(key: Key(builder.id));

  @override
  ListValueBuilderCubit cubit(BuildContext context) =>
      ListValueBuilderCubit(builder);

  @override
  Widget content(BuildContext context, ListValueBuilderState state) {
    if (metaData?.singleBox ?? true) {
      return _InlineListBuilderWidget(
        builder: builder,
        state: state,
        metaData: metaData,
      );
    }

    return _FullListBuilderWidget(
      builder: builder,
      state: state,
      metaData: metaData,
    );
  }
}

class _InlineListBuilderWidget extends StatelessWidget {
  final ExpressionMetaDataList? metaData;
  final ListValueBuilder builder;
  final ListValueBuilderState state;

  const _InlineListBuilderWidget({
    Key? key,
    this.metaData,
    required this.builder,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentBody(
      icon: SvgPicture.asset(SPIcons.list),
      name: metaData?.title ?? "List",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...state.expressions.asMap().entries.map((entry) {
            return _content(entry.key, entry.value);
          }).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: InsertRow(
              onPressed: () {
                if (metaData?.onInsert != null) {
                  builder.add(metaData!.onInsert!());
                } else {
                  builder.add(ExpressionBuilder.withConstantValue());
                }
              },
              title: "Insert",
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(int index, ExpressionBuilder expressionBuilder) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              SPIconButton(
                color: Colors.red,
                icon: const Icon(Icons.remove_circle_rounded),
                tooltip: "Remove",
                onPressed: () {
                  builder.remove(expressionBuilder);
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ExpressionBuilderWidget(
                  metaData: metaData?.child ??
                      ExpressionMetaDataNode(
                        index: index,
                        inline: true,
                      ),
                  builder: expressionBuilder,
                ),
              ),
              SPIconButton(
                onPressed: () {
                  final index = builder.indexOf(expressionBuilder);
                  if (index >= 0) {
                    builder.moveTo(expressionBuilder, index - 1);
                  }
                },
                tooltip: "Move up",
                icon: const Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Colors.blue,
                ),
              ),
              SPIconButton(
                onPressed: () {
                  final index = builder.indexOf(expressionBuilder);
                  if (index >= 0) {
                    builder.moveTo(expressionBuilder, index + 1);
                  }
                },
                tooltip: "Move down",
                icon: const Icon(
                  Icons.arrow_circle_down_outlined,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
        const Divider(height: 1, indent: 16),
      ],
    );
  }
}

class _FullListBuilderWidget extends StatelessWidget {
  final ExpressionMetaDataList? metaData;
  final ListValueBuilder builder;
  final ListValueBuilderState state;

  const _FullListBuilderWidget({
    Key? key,
    this.metaData,
    required this.builder,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Component(
      header: metaData?.title != null
          ? ComponentHeader(name: metaData!.title!)
          : null,
      body: [
        ...state.expressions
            .asMap()
            .entries
            .map((e) => ExpressionBuilderWidget(
                  builder: e.value,
                  metaData: ExpressionMetaDataNode(
                    index: e.key,
                    inline: false,
                  ),
                ))
            .toList(),
        ComponentAction(
          content: const Text("Insert"),
          onPressed: () {
            if (metaData?.onInsert != null) {
              builder.add(metaData!.onInsert!());
            } else {
              builder.add(ExpressionBuilder.withConstantValue());
            }
          },
        )
      ],
    );
  }
}
