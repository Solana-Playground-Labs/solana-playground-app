import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';

import 'value.dart';

class Expression extends Equatable {
  final Value value;

  const Expression({required this.value});

  @override
  List<Object?> get props => [value];

  static Expression fromJson(Map<String, dynamic> json) {
    return Expression(value: Value.fromJson(json['value']));
  }

  Map<String, dynamic> toJson() {
    return {
      'type': (Expression).toString(),
      'value': value.toJson(),
    };
  }

  ExpressionBuilder asBuilder() {
    return ExpressionBuilder(valueBuilder: value.asBuilder());
  }
}
