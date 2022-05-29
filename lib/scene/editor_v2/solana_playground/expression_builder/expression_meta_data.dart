/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

abstract class ExpressionMetaData {
  const ExpressionMetaData();
}

class ExpressionMetaDataNode extends ExpressionMetaData {
  final bool inline;
  final Type? type;

  const ExpressionMetaDataNode({this.inline = true, this.type});
}

class ExpressionMetaDataList extends ExpressionMetaData {
  final bool inline;
  final ExpressionMetaData child;

  const ExpressionMetaDataList({
    required this.inline,
    required this.child,
  });
}
