/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/value/account/account_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/value/bool/bool_value_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../editor_v2.dart';

typedef _MappingBuilder = Widget Function(
    BuildContext context, dynamic, ExpressionMetaDataNode metaDataNode);

final Map<Type, _MappingBuilder> _mapping = {
  ConstantValueBuilder: (context, builder, metaDataNode) =>
      ConstantValueBuilderWidget(builder: builder),
  VariableValueBuilder: (context, builder, metaDataNode) =>
      VariableValueBuilderWidget(builder: builder),
  BinaryValueBuilder: (context, builder, metaDataNode) =>
      BinaryValueBuilderWidget(builder: builder),
  ByteValueBuilder: (context, builder, metaDataNode) =>
      ByteValueBuilderWidget(builder: builder),
  HexValueBuilder: (context, builder, metaDataNode) =>
      HexValueBuilderWidget(builder: builder),
  StringByteValueBuilder: (context, builder, metaDataNode) =>
      StringByteValueBuilderWidget(builder: builder),
  ConditionValueBuilder: (context, builder, metaDataNode) =>
      ConditionValueBuilderWidget(builder: builder),
  ListValueBuilder: (context, builder, metaDataNode) =>
      ListValueBuilderWidget(builder: builder),
  AccountValueBuilder: (context, builder, metaDataNode) =>
      AccountValueBuilderWidget(builder: builder),
  BoolValueBuilder: (context, builder, metaDataNode) =>
      BoolValueBuilderWidget(builder: builder, metaDataNode: metaDataNode),
  InstructionValueBuilder: (context, builder, metaDataNode) =>
      InstructionValueBuilderWidget(builder: builder, metaData: metaDataNode),
  ConditionalWrapperValueBuilder: (context, builder, metaDataNode) =>
      ConditionalWrapperValueBuilderWidget(
          builder: builder, metaData: metaDataNode),
  NullValueBuilder: (context, builder, metaDataNode) =>
      const NullValueBuilderWidget(),
};

class ExpressionBuilderWidget
    extends CubitWidget<ExpressionBuilderCubit, ExpressionBuilderState> {
  final ExpressionBuilder builder;
  final ExpressionMetaData metaData;

  final bool changeable = true;

  ExpressionBuilderWidget({
    Key? key,
    required this.builder,
    this.metaData = const ExpressionMetaDataNode(),
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ExpressionBuilderState state) {
    if (metaData is ExpressionMetaDataList) {
      return buildList(context, state);
    }
    return buildValue(context, state);
  }

  Widget buildList(BuildContext context, ExpressionBuilderState state) {
    return ListValueBuilderWidget(
      metaData: metaData as ExpressionMetaDataList,
      builder: builder.valueBuilder as ListValueBuilder,
    );
  }

  Widget buildValue(BuildContext context, ExpressionBuilderState state) {
    final metaData = this.metaData as ExpressionMetaDataNode;

    final Widget child = _mapping[state.valueBuilder.runtimeType]
            ?.call(context, state.valueBuilder, metaData) ??
        const SPLabel(style: SPLabelStyle.orange, child: Text("Unknown"));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (metaData.inline &&
            metaData.changeable &&
            builder.valueBuilder is! ListValueBuilder) ...[
          SPLabel(
            style: SPLabelStyle.purple,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Text(builder.valueBuilder.name),
            ),
          ),
          const SizedBox(width: 4),
        ],
        Flexible(child: child),
      ],
    );
  }

  @override
  ExpressionBuilderCubit cubit(BuildContext context) =>
      ExpressionBuilderCubit(builder);
}
