/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class BoolMetaValueBuilder extends MetaValueBuilder {
  JsonValueBuilder builder;

  BoolMetaValueBuilder({required this.builder});

  @override
  Value build() {
    return JsonValue(data: builder.build());
  }

  @override
  BoolMetaValueBuilder clone() {
    return BoolMetaValueBuilder(builder: builder.clone());
  }
}
