import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/value/constant/constant_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/value/variable/variable_value_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'expression_builder_cubit.dart';

typedef MappingBuilder = Widget Function(BuildContext context, dynamic);

final Map<Type, MappingBuilder> _mapping = {
  ConstantValueBuilder: (context, builder) =>
      ConstantValueBuilderWidget(builder: builder),
  VariableValueBuilder: (context, builder) =>
      VariableValueBuilderWidget(builder: builder),
};

class ExpressionBuilderWidget
    extends CubitWidget<ExpressionBuilderCubit, ExpressionBuilderState> {
  final ExpressionBuilder builder;

  ExpressionBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ExpressionBuilderState state) {
    return _mapping[state.valueBuilder.runtimeType]
            ?.call(context, state.valueBuilder) ??
        const SPLabel(
          style: SPLabelStyle.orange,
          child: Text("Unknown"),
        );
  }

  @override
  ExpressionBuilderCubit cubit(BuildContext context) =>
      ExpressionBuilderCubit(builder);
}
