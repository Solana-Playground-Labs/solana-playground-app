/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class ConditionalWrapperAction {
  static bool isWrapable(BuildContext context, ValueBuilder valueBuilder) {
    try {
      final conditionalCubit =
          context.read<ConditionalWrapperValueBuilderCubit>();

      return !(conditionalCubit.builder.trueFlow.valueBuilder == valueBuilder ||
          conditionalCubit.builder.falseFlow.valueBuilder == valueBuilder);
    } catch (e) {
      return true;
    }
  }

  static void wrap(BuildContext context, ValueBuilder valueBuilder) {
    final cubit = context.read<ExpressionBuilderCubit>();
    if (cubit.builder.valueBuilder != valueBuilder) return;

    final currentValue = cubit.builder.valueBuilder;
    cubit.builder.valueBuilder = ConditionalWrapperValueBuilder(
      condition: ExpressionBuilder.withCondition(),
      trueFlow: ExpressionBuilder(valueBuilder: currentValue),
      falseFlow: ExpressionBuilder.withNull(),
    );
  }

  static void unwrap(
    BuildContext context,
    ConditionalWrapperValueBuilder conditionalWrapperValueBuilder,
    bool flow,
  ) {
    final cubit = context.read<ExpressionBuilderCubit>();
    if (cubit.builder.valueBuilder != conditionalWrapperValueBuilder) return;

    if (flow) {
      cubit.builder.valueBuilder =
          conditionalWrapperValueBuilder.trueFlow.valueBuilder;
    } else {
      cubit.builder.valueBuilder =
          conditionalWrapperValueBuilder.falseFlow.valueBuilder;
    }
  }

  static ExtraAction? asListAction(
      BuildContext context, ValueBuilder valueBuilder) {
    if (!ConditionalWrapperAction.isWrapable(context, valueBuilder)) {
      return null;
    }

    return ExtraAction(
        child: const Text("Wrap in condition"),
        onTap: () {
          ConditionalWrapperAction.wrap(context, valueBuilder);
        });
  }

  static ExtraAction? asUnwrapListAction(
      BuildContext context,
      ConditionalWrapperValueBuilder valueBuilder,
      bool flow,
      ) {
    if (!ConditionalWrapperAction.isWrapable(context, valueBuilder)) {
      return null;
    }

    return ExtraAction(
        child: flow
            ? const Text("Unwrap true flow")
            : const Text("Unwrap false flow"),
        onTap: () {
          ConditionalWrapperAction.unwrap(context, valueBuilder, flow);
        });
  }
}
