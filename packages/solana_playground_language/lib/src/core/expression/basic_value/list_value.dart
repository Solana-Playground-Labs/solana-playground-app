import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'list_value.custom_builder.dart';

class ListValue extends Value {
  final List<Expression> expressions;

  const ListValue({required this.expressions});

  factory ListValue.fromJson(Map<String, dynamic> json) {
    return ListValue(
        expressions: List.castFrom(
          json['expressions']
              .map(
                (e) => Expression.fromJson(e),
              )
              .toList(),
        ),
      );
  }

  @override
  ValueBuilder asBuilder() {
    return ListValueBuilder(
      expressions: expressions.map((e) => e.asBuilder()).toList(),
    );
  }

  @override
  List<Object?> get props => [expressions];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": runtimeType.toString(),
      "expressions": expressions.map((e) => e.toJson()).toList(),
    };
  }
}
