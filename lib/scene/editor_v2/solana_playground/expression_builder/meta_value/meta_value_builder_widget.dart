/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/meta_value/bool/bool_meta_value_widget.dart';
import 'package:solana_playground_language/lib.dart';

import '../../../editor_v2.dart';

abstract class MetaValueView {
  const MetaValueView();
}

class MetaValueListView extends MetaValueView {
  final bool isInline;
  final String? title;

  const MetaValueListView({
    required this.isInline,
    this.title,
  });
}

class MetaValueElementView extends MetaValueView {
  final String? title;
  final Type metaType;

  MetaValueElementView({this.title, required this.metaType});
}

class MetaValueInfo {
  final bool isInline;
  final bool isMultiple;

  final Type metaType;

  final String? title;

  const MetaValueInfo({
    this.isInline = false,
    required this.isMultiple,
    required this.metaType,
    this.title,
  });
}

class MetaValueBuilderWidget extends StatelessWidget {
  final int? index;
  final JsonValueBuilder builder;
  final MetaValueInfo info;

  const MetaValueBuilderWidget({
    Key? key,
    required this.builder,
    required this.info,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (info.isMultiple) {
      return ListMetaValueBuilderWidget(
        title: info.title,
        isInline: info.isInline,
        builder: ListMetaValueBuilder(builder: builder),
        widgetBuilder: (context, data, index) => MetaValueBuilderWidget(
          index: index + 1,
          builder: JsonValueBuilder(data: data),
          info: MetaValueInfo(
            isMultiple: false,
            metaType: info.metaType,
          ),
        ),
        onAdd: () {
          builder.update((data) {
            builder.data.add({});
          });
        },
      );
    }

    switch (info.metaType) {
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
          builder: BoolMetaValueBuilder(builder: builder),
        );
      default:
        return const Text("Unknown meta data");
    }
  }
}
