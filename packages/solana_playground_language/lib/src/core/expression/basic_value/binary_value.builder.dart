// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binary_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class BinaryValueBuilder extends ValueBuilder {
  final ExpressionBuilder data;

  @override
  String get name => "Binary";

  BinaryValueBuilder({
    required this.data,
  });

  @override
  BinaryValue build() {
    return BinaryValue(
      data: data.build(),
    );
  }

  @override
  BinaryValueBuilder clone() {
    return BinaryValueBuilder(
      data: data.clone(),
    );
  }
}

BinaryValue _$BinaryValueFromJson(Map<String, dynamic> json) {
  return BinaryValue(
    data: Expression.fromJson(json['data']),
  );
}

Map<String, dynamic> _$BinaryValueToJson(BinaryValue value) {
  return {
    'type': value.runtimeType.toString(),
    'data': value.data.toJson(),
  };
}

BinaryValueBuilder _$BinaryValueToBuilder(BinaryValue value) {
  return BinaryValueBuilder(data: value.data.asBuilder());
}
