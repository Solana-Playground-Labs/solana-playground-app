/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class NullValueBuilderWidget extends StatelessWidget {
  final ExpressionMetaDataNode? metaData;

  const NullValueBuilderWidget({Key? key, this.metaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (metaData?.inline == true) {
      return const SPLabel(
        style: SPLabelStyle.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Text("Null", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return const ComponentHeader(name: "Null");

  }
}
