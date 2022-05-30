/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/expression_meta_data.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'bool_value_builder_cubit.dart';

class BoolValueBuilderWidget
    extends CubitWidget<BoolValueBuilderCubit, BoolValueBuilderState> {
  final BoolValueBuilder builder;
  final ExpressionMetaDataNode? metaDataNode;

  BoolValueBuilderWidget({Key? key, required this.builder, this.metaDataNode})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BoolValueBuilderState state) {
    return Container(
      clipBehavior: Clip.hardEdge,
      constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
      decoration: BoxDecoration(
        color: state.value ? Colors.purple : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            context.read<BoolValueBuilderCubit>().toggle();
          },
          child: Center(
              child: Text(metaDataNode?.title ?? "T",
                  style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }

  @override
  BoolValueBuilderCubit cubit(BuildContext context) =>
      BoolValueBuilderCubit(builder);
}
