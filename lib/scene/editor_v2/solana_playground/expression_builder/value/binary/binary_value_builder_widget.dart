/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValueBuilderWidget extends StatelessWidget {
  final BinaryValueBuilder builder;

  BinaryValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return ExpressionBuilderWidget(
      builder: builder.data,
      metaData: ExpressionMetaDataList(
          title: "Data",
          singleBox: true,
          onInsert: () {
            return ExpressionBuilder(
              valueBuilder: ByteValueBuilder(
                expression: ExpressionBuilder.withConstantValue(),
                length: 1,
              ),
            );
          }),
    );
  }
}
