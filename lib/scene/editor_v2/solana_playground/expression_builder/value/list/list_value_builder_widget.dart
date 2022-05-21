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
  final ExpressionBuilder Function()? onCreate;
  final ListBuilder<ExpressionBuilder> builder;

  ListValueBuilderWidget({
    Key? key,
    this.title,
    required this.builder,
    this.onCreate,
  }) : super(key: Key(builder.id));

  @override
  ListValueBuilderCubit cubit(BuildContext context) =>
      ListValueBuilderCubit(builder);

  @override
  Widget content(BuildContext context, ListValueBuilderState state) {
    return ComponentBody(
      icon: SvgPicture.asset(SPIcons.list),
      name: title ?? "List",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...state.expressions.map((expressionBuilder) {
            return _content(expressionBuilder);
          }).toList(),
          SPIconButton(
            onPressed: () {
              final expressionBuilder = onCreate?.call();
              if (expressionBuilder != null) {
                builder.add(expressionBuilder);
              } else {
                builder.add(ExpressionBuilder.withConstantValue());
              }
            },
            icon: const Icon(Icons.add),
            tooltip: "Add",
          ),
        ],
      ),
    );
  }

  Widget _content(ExpressionBuilder expressionBuilder) {
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: IntrinsicWidth(
                        child: ExpressionBuilderWidget(
                          builder: expressionBuilder,
                          focusable: false,
                        ),
                      ),
                    )
                  ],
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
              ),
            ],
          ),
        ),
        const Divider(height: 1, indent: 16),
      ],
    );
  }
}
