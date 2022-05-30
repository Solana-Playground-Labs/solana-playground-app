/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';

class NullValue extends Value {
  const NullValue();

  factory NullValue.fromJson(Map<String, dynamic> json) => const NullValue();

  @override
  List<Object> get props => [];

  @override
  ValueBuilder asBuilder() {
    return NullValueBuilder();
  }

  @override
  Map<String, dynamic> toJson() {
    return {'type': classType};
  }
}

class NullValueBuilder extends ValueBuilder {
  @override
  Value build() {
    return const NullValue();
  }

  @override
  NullValueBuilder clone() {
    return NullValueBuilder();
  }
}
