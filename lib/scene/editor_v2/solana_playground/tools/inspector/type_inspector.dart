/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class TypeInspectorHelper {
  static const defaultTypeList = [
    ConstantValueBuilder,
    VariableValueBuilder,
    BoolValueBuilder,
    BinaryValueBuilder,
    ByteValueBuilder,
    HexValueBuilder,
    StringByteValueBuilder,
    NullValueBuilder,
    AccountValueBuilder,
    ConditionValueBuilder,
    InstructionValueBuilder,
    ListValueBuilder,
  ];

  static const basicTypeList = [
    ConstantValueBuilder,
    VariableValueBuilder,
  ];

  static const binaryTypeList = [
    ByteValueBuilder,
    HexValueBuilder,
    StringByteValueBuilder,
  ];
}

ValueBuilder _init(Type type) {
  switch (type) {
    case VariableValueBuilder:
      return VariableValueBuilder(variable: "");
    case BoolValueBuilder:
      return BoolValueBuilder(value: false);
    case BinaryValueBuilder:
      return BinaryValueBuilder(data: ExpressionBuilder.withList());
    case ByteValueBuilder:
      return ByteValueBuilder(
        expression: ExpressionBuilder.withStringValue(),
        length: 1,
      );
    case HexValueBuilder:
      return HexValueBuilder(expression: ExpressionBuilder.withStringValue());
    case StringByteValueBuilder:
      return StringByteValueBuilder(
        expression: ExpressionBuilder.withStringValue(),
        base: 58,
      );
    case NullValueBuilder:
      return NullValueBuilder();
    case AccountValueBuilder:
      return AccountValueBuilder(
        isSigner: ExpressionBuilder.withBool(),
        isWritable: ExpressionBuilder.withBool(),
        pubkey: ExpressionBuilder.withStringValue(),
      );
    case ConditionValueBuilder:
      return ConditionValueBuilder(
        comparisonOperator: ComparisonOperator.equal,
        left: ExpressionBuilder.withVariable(),
        right: ExpressionBuilder.withStringValue(),
      );
    case InstructionValueBuilder:
      return InstructionValueBuilder(
        programId: ExpressionBuilder.withStringValue(),
        keys: ExpressionBuilder.withList(),
        data: ExpressionBuilder.withList(),
      );
    case ListValueBuilder:
      return ListValueBuilder(expressions: []);
    default:
      return ConstantValueBuilder(value: "");
  }
}

class ExpressionInspectorView extends StatelessWidget {
  final ExpressionMetaData? metaData;
  final ExpressionBuilder builder;

  const ExpressionInspectorView(
      {Key? key, required this.builder, this.metaData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Type inspector"),
      ),
      body: metaData is ExpressionMetaDataNode
          ? content(context, metaData as ExpressionMetaDataNode)
          : unavaiable(context),
    );
  }

  Widget content(BuildContext context, ExpressionMetaDataNode metaDataNode) {
    final theme = Theme.of(context);

    return ListView.separated(
      itemCount: metaDataNode.allowTypes.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final type = metaDataNode.allowTypes[index];
        return ListTile(
          tileColor: theme.colorScheme.surface,
          title: Text(type.toString()),
          trailing: builder.valueBuilder.runtimeType == type
              ? const Icon(Icons.check)
              : null,
          onTap: () {
            if (builder.valueBuilder.runtimeType == type) return;
            builder.valueBuilder = _init(type);
            context.router.pop();
          },
        );
      },
    );
  }

  Widget unavaiable(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        "🚨 Impossible to inspect 🚨",
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
