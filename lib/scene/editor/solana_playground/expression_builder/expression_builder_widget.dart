import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/value/constant/constant_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/value/variable/variable_value_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'expression_builder_cubit.dart';

typedef MappingBuilder = Widget Function(
    BuildContext context, dynamic, FocusNode focusNode);

final Map<Type, MappingBuilder> _mapping = {
  ConstantValueBuilder: (context, builder, focus) =>
      ConstantValueBuilderWidget(builder: builder, focusNode: focus),
  VariableValueBuilder: (context, builder, focus) =>
      VariableValueBuilderWidget(builder: builder, focusNode: focus),
};

class ExpressionBuilderWidget
    extends CubitWidget<ExpressionBuilderCubit, ExpressionBuilderState> {
  final ExpressionBuilder builder;

  ExpressionBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ExpressionBuilderState state) {
    final widget = _mapping[state.valueBuilder.runtimeType]
            ?.call(context, state.valueBuilder, context.read<ExpressionBuilderCubit>().focusNode) ??
        const SPLabel(
          style: SPLabelStyle.orange,
          child: Text("Unknown"),
        );

    return Focus(
      child: widget,
      onFocusChange: (hasFocus) {
        if (hasFocus) context.read<CodeEditorCubit>().focus(builder);
      },
    );
  }

  @override
  ExpressionBuilderCubit cubit(BuildContext context) =>
      ExpressionBuilderCubit(builder);
}
