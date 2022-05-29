/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../editor_v2.dart';

typedef _MappingBuilder = Widget Function(
    BuildContext context, dynamic, FocusNode focusNode);

final Map<Type, _MappingBuilder> _mapping = {
  ConstantValueBuilder: (context, builder, focus) =>
      ConstantValueBuilderWidget(builder: builder, focusNode: focus),
  VariableValueBuilder: (context, builder, focus) =>
      VariableValueBuilderWidget(builder: builder, focusNode: focus),
  BinaryValueBuilder: (context, builder, focus) =>
      BinaryValueBuilderWidget(builder: builder),
  ByteValueBuilder: (context, builder, focus) =>
      ByteValueBuilderWidget(builder: builder),
  HexValueBuilder: (context, builder, focus) =>
      HexValueBuilderWidget(builder: builder),
  StringByteValueBuilder: (context, builder, focus) =>
      StringByteValueBuilderWidget(builder: builder),
  ConditionalValueBuilder: (context, builder, focus) =>
      ConditionalValueBuilderWidget(builder: builder),
  ListValueBuilder: (context, builder, focus) =>
      ListValueBuilderWidget(builder: builder),
};

class ExpressionBuilderWidget
    extends CubitWidget<ExpressionBuilderCubit, ExpressionBuilderState> {
  final ExpressionBuilder builder;
  final ExpressionMetaData metaData;

  final bool changeable = true;
  final bool isInline = true;

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
      builder: builder.valueBuilder as ListValueBuilder,
    );
  }

  Widget buildValue(BuildContext context, ExpressionBuilderState state) {
    final Widget child = _mapping[state.valueBuilder.runtimeType]?.call(
            context,
            state.valueBuilder,
            context.read<ExpressionBuilderCubit>().focusNode) ??
        const SPLabel(
          style: SPLabelStyle.orange,
          child: Text("Unknown"),
        );

    final metaData = this.metaData as ExpressionMetaDataNode;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (metaData.inline &&
            changeable &&
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
