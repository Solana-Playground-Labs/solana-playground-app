/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/expression/value_builder.dart';

@ValueJsonBuildable()
abstract class Value extends Equatable with ObjectType {
  const Value();

  static Value fromJson(Map<String, dynamic> json) {
    final type = json['type'];

    if (type == (BinaryValue).toString()) {
      return BinaryValue.fromJson(json);
    } else if (type == (ByteValue).toString()) {
      return ByteValue.fromJson(json);
    } else if (type == (HexValue).toString()) {
      return HexValue.fromJson(json);
    } else if (type == (StringByteValue).toString()) {
      return StringByteValue.fromJson(json);
    } else if (type == (ExpressionValue).toString()) {
      return ExpressionValue.fromJson(json);
    } else if (type == (VariableValue).toString()) {
      return VariableValue.fromJson(json);
    } else if (type == (ConditionValue).toString()) {
      return ConditionValue.fromJson(json);
    } else if (type == (ListValue).toString()) {
      return ListValue.fromJson(json);
    } else if (type == (AccountValue).toString()) {
      return AccountValue.fromJson(json);
    } else if (type == (InstructionValue).toString()) {
      return AccountValue.fromJson(json);
    } else if (type == (StringValue).toString()) {
      return StringValue.fromJson(json);
    }else if (type == (IntValue).toString()) {
      return IntValue.fromJson(json);
    }else if (type == (DoubleValue).toString()) {
      return DoubleValue.fromJson(json);
    }
    return UnknownValue(rawData: json);
  }

  Map<String, dynamic> toJson();

  ValueBuilder asBuilder();
}
