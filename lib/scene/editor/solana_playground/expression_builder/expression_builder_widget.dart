import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/editor/model/focus_builder.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/value/binary/binary_value_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

typedef _MappingBuilder = Widget Function(
    BuildContext context, dynamic, FocusNode focusNode);

final Map<Type, _MappingBuilder> _mapping = {
  ConstantValueBuilder: (context, builder, focus) =>
      ConstantValueBuilderWidget(builder: builder, focusNode: focus),
  VariableValueBuilder: (context, builder, focus) =>
      VariableValueBuilderWidget(builder: builder, focusNode: focus),
  BinaryValueBuilder: (context, builder, focus) =>
      BinaryValueBuilderWidget(builder: builder),
};

class ExpressionBuilderWidget
    extends CubitWidget<ExpressionBuilderCubit, ExpressionBuilderState> {
  final ExpressionBuilder builder;
  final MetaValueInfo? metaValueInfo;
  final String? label;

  ExpressionBuilderWidget({
    Key? key,
    this.label,
    required this.builder,
    this.metaValueInfo,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ExpressionBuilderState state) {
    final widget = metaValueInfo != null
        ? MetaValueBuilderWidget(
            builder: builder.valueBuilder as JsonValueBuilder,
            info: metaValueInfo!,
          )
        : Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                context.read<CodeEditorCubit>().focus(ExpressionFocusBuilder(
                      label: label,
                      builder: builder,
                    ));
              }
            },
            child: _mapping[state.valueBuilder.runtimeType]?.call(
                    context,
                    state.valueBuilder,
                    context.read<ExpressionBuilderCubit>().focusNode) ??
                const SPLabel(
                  style: SPLabelStyle.orange,
                  child: Text("Unknown"),
                ),
          );
    return widget;
  }

  @override
  ExpressionBuilderCubit cubit(BuildContext context) =>
      ExpressionBuilderCubit(builder);
}
