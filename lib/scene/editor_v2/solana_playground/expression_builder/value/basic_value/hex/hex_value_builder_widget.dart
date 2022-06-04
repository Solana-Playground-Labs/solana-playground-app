/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

import 'hex_value_builder_cubit.dart';

class HexValueBuilderWidget
    extends CubitWidget<HexValueBuilderCubit, HexValueBuilderState> {
  final HexValueBuilder builder;

  HexValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, HexValueBuilderState state) {
    return ExpressionBuilderWidget(
      builder: builder.expression,
      metaData: const ExpressionMetaDataNode(
        allowTypes: TypeInspectorHelper.basicTypeList,
      ),
    );
  }

  @override
  HexValueBuilderCubit cubit(BuildContext context) =>
      HexValueBuilderCubit(builder);
}
