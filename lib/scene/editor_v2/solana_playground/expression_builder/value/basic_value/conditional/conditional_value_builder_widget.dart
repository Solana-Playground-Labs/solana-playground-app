/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ConditionValueBuilderWidget
    extends CubitWidget<ConditionalValueBuilderCubit, ConditionalValueBuilderState> {
  final ConditionValueBuilder builder;

  ConditionValueBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ConditionalValueBuilderState state) {
    return Wrap(
      children: [
        ExpressionBuilderWidget(builder: builder.left),
        const SizedBox(width: 8),
        SPLabel(
          style: SPLabelStyle.keppel,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.5),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<ComparisonOperator>(
                  alignment: Alignment.center,
                  isDense: true,
                  iconEnabledColor: Colors.white70,
                  elevation: 1,
                  value: state.comparisonOperator,
                  onChanged: (item) {
                    if (item != null) {
                      context.read<ConditionalValueBuilderCubit>().setOperator(item);
                    }
                  },
                  items: ComparisonOperator.values
                      .map(
                        (operator) => DropdownMenuItem(
                          value: operator,
                          child: Text(operator.asTitle),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ExpressionBuilderWidget(builder: builder.right),
      ],
    );
  }

  @override
  ConditionalValueBuilderCubit cubit(BuildContext context) => ConditionalValueBuilderCubit(builder);
}

extension ComparisonOperatorExtensions on ComparisonOperator {
  String get asTitle {
    switch (this) {
      case ComparisonOperator.equal:
        return "=";
      case ComparisonOperator.notEqual:
        return "!=";
      case ComparisonOperator.less:
        return "<";
      case ComparisonOperator.lessOrEqual:
        return "<=";
      case ComparisonOperator.greater:
        return ">";
      case ComparisonOperator.greaterOrEqual:
        return ">=";
    }

    switch (this) {
      case ComparisonOperator.equal:
        return "equal";
      case ComparisonOperator.notEqual:
        return "not equal";
      case ComparisonOperator.less:
        return "less";
      case ComparisonOperator.lessOrEqual:
        return "less or equal";
      case ComparisonOperator.greater:
        return "greater";
      case ComparisonOperator.greaterOrEqual:
        return "greater or equal";
    }
  }
}
