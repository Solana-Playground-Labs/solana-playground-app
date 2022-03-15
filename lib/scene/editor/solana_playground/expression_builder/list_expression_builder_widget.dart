/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/model/focus_builder.dart';
import 'package:solana_playground_language/lib.dart';

import 'expression_builder_widget.dart';

class ListExpressionBuilderWidget extends StatelessWidget {
  final ExpressionBuilder Function()? onCreate;
  final ListBuilder<ExpressionBuilder> builders;

  ListExpressionBuilderWidget({Key? key, required this.builders, this.onCreate})
      : super(key: Key(builders.id));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...builders.map((builder) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () {
                context.read<CodeEditorCubit>().focus(
                      ExpressionFocusBuilder(
                        label: "Data",
                        builder: builder,
                      ),
                    );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ExpressionBuilderWidget(
                      builder: builder,
                      focusable: false,
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(minHeight: 0),
                    onPressed: () {
                      final index = builders.indexOf(builder);
                      if (index >= 0) builders.moveTo(builder, index - 1);
                    },
                    icon: const Icon(Icons.arrow_circle_up_outlined),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(minHeight: 0),
                    onPressed: () {
                      final index = builders.indexOf(builder);
                      if (index >= 0) builders.moveTo(builder, index + 1);
                    },
                    icon: const Icon(Icons.arrow_circle_down_outlined),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(minHeight: 0),
                    onPressed: () {
                      builders.remove(builder);
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        IconButton(
            onPressed: () {
              final builder = onCreate?.call();
              if (builder != null) {
                builders.add(builder);
              }
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
