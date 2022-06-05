/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sp_create_account_with_seed_value.builder.dart';

@ValueBuildable()
class SpCreateAccountWithSeedValue extends Value {
  @ValuePropertyBuildable()
  final Expression fromPubkey;

  @ValuePropertyBuildable()
  final Expression newAccountPubkey;

  @ValuePropertyBuildable()
  final Expression basePubkey;

  @ValuePropertyBuildable()
  final Expression seed;

  @ValuePropertyBuildable()
  final Expression lamports;

  @ValuePropertyBuildable()
  final Expression space;

  @ValuePropertyBuildable()
  final Expression owner;


  const SpCreateAccountWithSeedValue({
    required this.fromPubkey,
    required this.newAccountPubkey,
    required this.basePubkey,
    required this.seed,
    required this.lamports,
    required this.space,
    required this.owner,
  });

  @override
  List<Object> get props =>
      [fromPubkey, newAccountPubkey, basePubkey, seed, lamports, space, owner,];

  factory SpCreateAccountWithSeedValue.fromJson(Map<String, dynamic> json) {
    return _$SpCreateAccountWithSeedValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$SpCreateAccountWithSeedValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SpCreateAccountWithSeedValueToJson(this);
  }
}