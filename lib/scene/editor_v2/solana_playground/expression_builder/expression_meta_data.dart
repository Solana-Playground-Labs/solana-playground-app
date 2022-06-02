/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/widgets.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart';
import 'package:solana_playground_language/lib.dart';

abstract class ExpressionMetaData {
  const ExpressionMetaData();
}

class ExpressionMetaDataNode extends ExpressionMetaData {
  final int? index;
  final String? title;
  final bool inline;
  final bool changeable;
  final Type? type;
  final List<Type> allowTypes;

  const ExpressionMetaDataNode({
    this.index,
    this.title,
    this.inline = true,
    this.type,
    this.changeable = true,
    this.allowTypes = TypeInspectorHelper.defaultTypeList,
  });
}

class ExpressionMetaDataList extends ExpressionMetaData {
  final String? title;
  final bool singleBox;
  final ExpressionMetaData? child;
  final ExpressionBuilder Function()? onInsert;

  const ExpressionMetaDataList({
    this.title,
    this.singleBox = false,
    this.onInsert,
    this.child,
  });
}
