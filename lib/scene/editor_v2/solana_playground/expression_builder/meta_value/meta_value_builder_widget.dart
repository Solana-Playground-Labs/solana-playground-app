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
  final MetaValueView child;

  const MetaValueListView({
    this.isInline = false,
    this.title,
    this.addText = "Insert",
    required this.child,
  });
}

class MetaValueElementView extends MetaValueView {
  final String? title;
  final Type metaType;

  const MetaValueElementView({this.title, required this.metaType});
}

class MetaValueBuilderWidget extends StatelessWidget {
  final int? index;
  final JsonValueBuilder builder;
  final MetaValueView view;

  const MetaValueBuilderWidget({
    Key? key,
    required this.builder,
    required this.view,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final view = this.view;
    if (view is MetaValueListView) {
      return ListMetaValueBuilderWidget(
        title: view.title,
        addText: view.addText,
        isInline: view.isInline,
        builder: ListMetaValueBuilder(builder: builder),
        widgetBuilder: (context, data, index) => MetaValueBuilderWidget(
          index: index + 1,
          builder: JsonValueBuilder(data: data),
          view: view.child,
        ),
        onAdd: () {
          builder.update((data) {
            builder.data.add({});
          });
        },
      );
    }

    if (view is MetaValueElementView) {
      switch (view.metaType) {
        case AccountMetaValueBuilder:
          return AccountMetaValueBuilderWidget(
            builder: AccountMetaValueBuilder(builder: builder),
          );
        case SignaturePubkeyParsMetaValueBuilder:
          return SignaturePubkeyPairMetaValueBuilderWidget(
            builder: SignaturePubkeyParsMetaValueBuilder.fromJsonValue(builder),
          );
        case TransactionInstructionMetaValueBuilder:
          return TransactionInstructionMetaValueBuilderWidget(
            index: index,
            builder: TransactionInstructionMetaValueBuilder(builder: builder),
          );
        case SignerMetaValueBuilder:
          return SignerMetaValueBuilderWidget(
            builder: SignerMetaValueBuilder(builder: builder),
          );
        case BoolMetaValueBuilder:
          return BoolMetaValueWidget(
            title: view.title,
            builder: BoolMetaValueBuilder(
              builder: builder,
            ),
          );
        default:
          return const Text("Unknown meta data");
      }
    }

    return const Text("Unknown meta data");
  }
}
