/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/expression/unknown_value_builder.dart';

class UnknownValue extends Value {
  final dynamic rawData;

  const UnknownValue({
    required this.rawData,
  });

  @override
  List<Object?> get props => [rawData];

  factory UnknownValue.fromJson(Map<String, dynamic> json) {
    return UnknownValue(rawData: json);
  }

  @override
  Map<String, dynamic> toJson() {
    return rawData;
  }

  @override
  ValueBuilder asBuilder() {
    return UnknownValueBuilder(rawData: rawData);
  }

}
