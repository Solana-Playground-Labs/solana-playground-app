// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_create_account_with_seed_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class SpCreateAccountWithSeedValueBuilder extends ValueBuilder {
  final ExpressionBuilder fromPubkey;
  final ExpressionBuilder newAccountPubkey;
  final ExpressionBuilder basePubkey;
  final ExpressionBuilder seed;
  final ExpressionBuilder lamports;
  final ExpressionBuilder space;
  final ExpressionBuilder owner;

  @override
  String get name => "SpCreateAccountWithSeed";

  SpCreateAccountWithSeedValueBuilder({
    required this.fromPubkey,
    required this.newAccountPubkey,
    required this.basePubkey,
    required this.seed,
    required this.lamports,
    required this.space,
    required this.owner,
  });

  @override
  SpCreateAccountWithSeedValue build() {
    return SpCreateAccountWithSeedValue(
      fromPubkey: fromPubkey.build(),
      newAccountPubkey: newAccountPubkey.build(),
      basePubkey: basePubkey.build(),
      seed: seed.build(),
      lamports: lamports.build(),
      space: space.build(),
      owner: owner.build(),
    );
  }

  @override
  SpCreateAccountWithSeedValueBuilder clone() {
    return SpCreateAccountWithSeedValueBuilder(
      fromPubkey: fromPubkey.clone(),
      newAccountPubkey: newAccountPubkey.clone(),
      basePubkey: basePubkey.clone(),
      seed: seed.clone(),
      lamports: lamports.clone(),
      space: space.clone(),
      owner: owner.clone(),
    );
  }
}

SpCreateAccountWithSeedValue _$SpCreateAccountWithSeedValueFromJson(Map<String, dynamic> json) {
  return SpCreateAccountWithSeedValue(
    fromPubkey: Expression.fromJson(json['fromPubkey']),
    newAccountPubkey: Expression.fromJson(json['newAccountPubkey']),
    basePubkey: Expression.fromJson(json['basePubkey']),
    seed: Expression.fromJson(json['seed']),
    lamports: Expression.fromJson(json['lamports']),
    space: Expression.fromJson(json['space']),
    owner: Expression.fromJson(json['owner']),
  );
}

Map<String, dynamic> _$SpCreateAccountWithSeedValueToJson(SpCreateAccountWithSeedValue value) {
  return {
    'type': value.runtimeType.toString(),
    'fromPubkey': value.fromPubkey.toJson(),
    'newAccountPubkey': value.newAccountPubkey.toJson(),
    'basePubkey': value.basePubkey.toJson(),
    'seed': value.seed.toJson(),
    'lamports': value.lamports.toJson(),
    'space': value.space.toJson(),
    'owner': value.owner.toJson(),
  };
}

SpCreateAccountWithSeedValueBuilder _$SpCreateAccountWithSeedValueToBuilder(
    SpCreateAccountWithSeedValue value) {
  return SpCreateAccountWithSeedValueBuilder(
      fromPubkey: value.fromPubkey.asBuilder(),
      newAccountPubkey: value.newAccountPubkey.asBuilder(),
      basePubkey: value.basePubkey.asBuilder(),
      seed: value.seed.asBuilder(),
      lamports: value.lamports.asBuilder(),
      space: value.space.asBuilder(),
      owner: value.owner.asBuilder());
}
