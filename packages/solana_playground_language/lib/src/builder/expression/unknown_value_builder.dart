/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class UnknownValueBuilder extends ValueBuilder {
  final dynamic rawData;

  UnknownValueBuilder({
    required this.rawData,
  });

  @override
  Value build() {
    return UnknownValue(rawData: rawData);
  }

  @override
  ValueBuilder clone() {
    return UnknownValueBuilder(rawData: rawData);
  }
}
