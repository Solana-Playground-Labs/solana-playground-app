// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_create_account_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class SpCreateAccountValueBuilder extends ValueBuilder {
  final ExpressionBuilder fromPubkey;
  final ExpressionBuilder newAccountPubkey;
  final ExpressionBuilder lamports;
  final ExpressionBuilder space;
  final ExpressionBuilder owner;

  @override
  String get name => "SpCreateAccount";

  SpCreateAccountValueBuilder({
    required this.fromPubkey,
    required this.newAccountPubkey,
    required this.lamports,
    required this.space,
    required this.owner,
  });

  @override
  SpCreateAccountValue build() {
    return SpCreateAccountValue(
      fromPubkey: fromPubkey.build(),
      newAccountPubkey: newAccountPubkey.build(),
      lamports: lamports.build(),
      space: space.build(),
      owner: owner.build(),
    );
  }

  @override
  SpCreateAccountValueBuilder clone() {
    return SpCreateAccountValueBuilder(
      fromPubkey: fromPubkey.clone(),
      newAccountPubkey: newAccountPubkey.clone(),
      lamports: lamports.clone(),
      space: space.clone(),
      owner: owner.clone(),
    );
  }
}

SpCreateAccountValue _$SpCreateAccountValueFromJson(Map<String, dynamic> json) {
  return SpCreateAccountValue(
    fromPubkey: Expression.fromJson(json['fromPubkey']),
    newAccountPubkey: Expression.fromJson(json['newAccountPubkey']),
    lamports: Expression.fromJson(json['lamports']),
    space: Expression.fromJson(json['space']),
    owner: Expression.fromJson(json['owner']),
  );
}

Map<String, dynamic> _$SpCreateAccountValueToJson(SpCreateAccountValue value) {
  return {
    'type': value.runtimeType.toString(),
    'fromPubkey': value.fromPubkey.toJson(),
    'newAccountPubkey': value.newAccountPubkey.toJson(),
    'lamports': value.lamports.toJson(),
    'space': value.space.toJson(),
    'owner': value.owner.toJson(),
  };
}

SpCreateAccountValueBuilder _$SpCreateAccountValueToBuilder(SpCreateAccountValue value) {
  return SpCreateAccountValueBuilder(
      fromPubkey: value.fromPubkey.asBuilder(),
      newAccountPubkey: value.newAccountPubkey.asBuilder(),
      lamports: value.lamports.asBuilder(),
      space: value.space.asBuilder(),
      owner: value.owner.asBuilder());
}
