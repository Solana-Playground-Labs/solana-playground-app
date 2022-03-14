import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'expression_inspector_cubit.dart';

List<Type> _supportedValue = [
  ConstantValueBuilder,
  VariableValueBuilder,
  BinaryValueBuilder,
  ByteValueBuilder,
  HexValueBuilder,
  StringByteValueBuilder,
];

String _valueToString(Type builderType) {
  switch (builderType) {
    case ConstantValueBuilder:
      return "Constant";
    case VariableValueBuilder:
      return "Variable";
    case BinaryValueBuilder:
      return "Binary";
    case ByteValueBuilder:
      return "Byte";
    case HexValueBuilder:
      return "Hex";
    case StringByteValueBuilder:
      return "String byte";
    default:
      return "Unknown";
  }
}

class ExpressionInspectorWidget
    extends CubitWidget<ExpressionInspectorCubit, ExpressionInspectorState> {
  final ExpressionBuilder builder;
  final String? label;

  ExpressionInspectorWidget({Key? key, this.label, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ExpressionInspectorState state) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (label != null) Text(label!),
          const Divider(),
          Text("Value type:", style: theme.textTheme.bodyText1),
          Wrap(
            runSpacing: 0,
            spacing: 8,
            children: _supportedValue.map((type) {
              return ChoiceChip(
                label: Text(_valueToString(type)),
                onSelected: (isSelected) {
                  if (!isSelected) return;
                  FocusScope.of(context).unfocus();
                  switch (type) {
                    case ConstantValueBuilder:
                      builder.valueBuilder = ConstantValueBuilder(value: "");
                      break;
                    case VariableValueBuilder:
                      builder.valueBuilder = VariableValueBuilder(variable: "");
                      break;
                    case BinaryValueBuilder:
                      builder.valueBuilder = BinaryValueBuilder(data: []);
                      break;
                    case ByteValueBuilder:
                      builder.valueBuilder = ByteValueBuilder.empty();
                      break;
                    case HexValueBuilder:
                      builder.valueBuilder = HexValueBuilder(
                        expression: ExpressionBuilder.withConstantValue(),
                      );
                      break;
                    case StringByteValueBuilder:
                      builder.valueBuilder = StringByteValueBuilder(
                        expression: ExpressionBuilder.withConstantValue(),
                        base: 58,
                      );
                      break;
                    default:
                      break;
                  }
                },
                selectedColor: Colors.indigo,
                selected: state.valueBuilder.runtimeType == type,
              );
            }).toList(),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  ExpressionInspectorCubit cubit(BuildContext context) =>
      ExpressionInspectorCubit(builder);
}
