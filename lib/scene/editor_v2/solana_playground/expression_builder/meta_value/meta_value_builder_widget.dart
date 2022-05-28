/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_language/lib.dart';

import '../../../editor_v2.dart';

abstract class MetaValueView {
  const MetaValueView();
}

class MetaValueListView extends MetaValueView {
  final bool isInline;
  final String? title;
  final String addText;
  final MetaValueView? child;

  const MetaValueListView({
    this.isInline = false,
    this.title,
    this.addText = "Insert",
    this.child,
  });
}

class MetaValueElementView extends MetaValueView {
  final String? title;
  final Type metaType;

  const MetaValueElementView({this.title, required this.metaType});
}

class MetaValueBuilderWidget extends StatelessWidget {
  final int? index;
  final ExpressionBuilder builder;
  final MetaValueView? view;

  const MetaValueBuilderWidget({
    Key? key,
    required this.builder,
    this.view,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final view = this.view;
    final valueBuilder = builder.valueBuilder;

    if (valueBuilder is JsonValueBuilder) {
      if (view is MetaValueListView) {
        return ListMetaValueBuilderWidget(
          title: view.title,
          addText: view.addText,
          isInline: view.isInline,
          builder: ListMetaValueBuilder(builder: valueBuilder),
          widgetBuilder: (context, data, index) => MetaValueBuilderWidget(
            index: index + 1,
            builder: data,
            view: view.child,
          ),
          onAdd: () {
            valueBuilder.update((data) {
              if (view.child == null) {
                valueBuilder.data.add(ExpressionBuilder.withVariable());
              } else {
                valueBuilder.data.add(ExpressionBuilder.withJson(data: {}));
              }
            });
          },
        );
      }

      if (view is MetaValueElementView) {
        switch (view.metaType) {
          case AccountMetaValueBuilder:
            return AccountMetaValueBuilderWidget(
              builder: AccountMetaValueBuilder(builder: valueBuilder),
            );
          case TransactionInstructionMetaValueBuilder:
            return TransactionInstructionMetaValueBuilderWidget(
              index: index,
              builder:
                  TransactionInstructionMetaValueBuilder(builder: valueBuilder),
            );
          case SignerMetaValueBuilder:
            return SignerMetaValueBuilderWidget(
              builder: SignerMetaValueBuilder(builder: valueBuilder),
            );
          case BoolMetaValueBuilder:
            return BoolMetaValueWidget(
              title: view.title,
              builder: BoolMetaValueBuilder(
                builder: valueBuilder,
              ),
            );
          default:
            return const Text("Unknown meta data");
        }
      }
    }

    return ListElementInlineAction(
      builder: builder,
      content: ExpressionBuilderWidget(builder: builder),
    );
  }
}
