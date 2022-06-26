// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_assign_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class SpAssignValueBuilder extends ValueBuilder {
  final ExpressionBuilder accountPubkey;
  final ExpressionBuilder owner;

  @override
  String get name => "SpAssign";

  SpAssignValueBuilder({
    required this.accountPubkey,
    required this.owner,
  });

  @override
  SpAssignValue build() {
    return SpAssignValue(
      accountPubkey: accountPubkey.build(),
      owner: owner.build(),
    );
  }

  @override
  SpAssignValueBuilder clone() {
    return SpAssignValueBuilder(
      accountPubkey: accountPubkey.clone(),
      owner: owner.clone(),
    );
  }
}

SpAssignValue _$SpAssignValueFromJson(Map<String, dynamic> json) {
  return SpAssignValue(
    accountPubkey: Expression.fromJson(json['accountPubkey']),
    owner: Expression.fromJson(json['owner']),
  );
}

Map<String, dynamic> _$SpAssignValueToJson(SpAssignValue value) {
  return {
    'type': value.runtimeType.toString(),
    'accountPubkey': value.accountPubkey.toJson(),
    'owner': value.owner.toJson(),
  };
}

SpAssignValueBuilder _$SpAssignValueToBuilder(SpAssignValue value) {
  return SpAssignValueBuilder(
      accountPubkey: value.accountPubkey.asBuilder(),
      owner: value.owner.asBuilder());
}
