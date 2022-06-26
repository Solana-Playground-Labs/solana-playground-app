/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class TypeInspectorHelper {
  static const defaultTypeList = [
    StringValueBuilder,
    IntValueBuilder,
    DoubleValueBuilder,
    ComputableValueBuilder,
    VariableValueBuilder,
    BoolValueBuilder,
    BinaryValueBuilder,
    ByteValueBuilder,
    HexValueBuilder,
    StringByteValueBuilder,
    StringUtf8ValueBuilder,
    NullValueBuilder,
    AccountValueBuilder,
    ConditionValueBuilder,
    InstructionValueBuilder,
    ListValueBuilder,
  ];

  static const basicTypeList = [
    StringValueBuilder,
    IntValueBuilder,
    DoubleValueBuilder,
    ComputableValueBuilder,
    VariableValueBuilder,
  ];

  static const binaryTypeList = [
    ByteValueBuilder,
    HexValueBuilder,
    StringByteValueBuilder,
    StringUtf8ValueBuilder,
  ];
}

class _Group {
  final String name;
  final List<Type> types;

  const _Group({
    required this.name,
    required this.types,
  });
}

const _typeGroups = [
  _Group(name: "Memory", types: [VariableValueBuilder]),
  _Group(name: "Scalar", types: [
    StringValueBuilder,
    IntValueBuilder,
    DoubleValueBuilder,
    BoolValueBuilder,
  ]),
  _Group(name: "Data", types: [
    BinaryValueBuilder,
    ByteValueBuilder,
    HexValueBuilder,
    StringByteValueBuilder,
    StringUtf8ValueBuilder,
    NullValueBuilder,
  ]),
  _Group(
    name: "Special",
    types: [
      ComputableValueBuilder,
      BoolValueBuilder,
      ListValueBuilder,
    ],
  ),
  _Group(
    name: "Instruction",
    types: [
      AccountValueBuilder,
      InstructionValueBuilder,
    ],
  )
];

String _typeName(Type type) {
  return type.toString().replaceAll("ValueBuilder", "");
}

ValueBuilder _init(Type type) {
  switch (type) {
    case StringValueBuilder:
      return StringValueBuilder(value: "");
    case IntValueBuilder:
      return IntValueBuilder(value: 0);
    case DoubleValueBuilder:
      return DoubleValueBuilder(value: 0.0);
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
    case StringUtf8ValueBuilder:
      return StringUtf8ValueBuilder(expression: ExpressionBuilder.withStringValue());
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
      return ComputableValueBuilder(value: "");
  }
}

class ExpressionInspectorView extends StatelessWidget {
  final ExpressionMetaData? metaData;
  final ExpressionBuilder builder;

  const ExpressionInspectorView({Key? key, required this.builder, this.metaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
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

    final groups = _typeGroups.where((group) {
      for (final allowType in metaDataNode.allowTypes) {
        if (group.types.contains(allowType)) return true;
      }
      return false;
    }).toList();

    return CustomScrollView(
      slivers: groups
          .map(
            (group) => MultiSliver(
              children: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    child: Text(
                      group.name,
                      style: theme.textTheme.headline6,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final type = group.types[index];
                      return _TypeCell(
                        builder: builder,
                        type: type,
                        isSelected: builder.valueBuilder.runtimeType == type,
                        lastElement: !(index + 1 < group.types.length),
                      );
                    },
                    childCount: group.types.length,
                  ),
                )
              ],
            ),
          )
          .toList(),
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

class _TypeCell extends StatelessWidget {
  const _TypeCell({
    Key? key,
    required this.builder,
    required this.type,
    this.lastElement = false,
    this.isSelected = false,
  }) : super(key: key);

  final ExpressionBuilder builder;
  final Type type;
  final bool lastElement;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (builder.valueBuilder.runtimeType == type) return;
            builder.valueBuilder = _init(type);
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: Row(
              children: [
                Text(_typeName(type)),
                const Spacer(),
                if (isSelected) const Icon(Icons.check)
              ],
            ),
          ),
        ),
        if (!lastElement) const Divider(height: 1, indent: 16),
      ],
    );
  }
}
