/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sp_create_account_value.builder.dart';

@ValueBuildable()
class SpCreateAccountValue extends Value {
  @ValuePropertyBuildable()
  final Expression fromPubkey;

  @ValuePropertyBuildable()
  final Expression newAccountPubkey;

  @ValuePropertyBuildable()
  final Expression lamports;

  @ValuePropertyBuildable()
  final Expression space;

  @ValuePropertyBuildable()
  final Expression owner;

  const SpCreateAccountValue({
    required this.fromPubkey,
    required this.newAccountPubkey,
    required this.lamports,
    required this.space,
    required this.owner,
  });

  @override
  List<Object> get props => [
        fromPubkey,
        newAccountPubkey,
        lamports,
        space,
        owner,
      ];

  factory SpCreateAccountValue.fromJson(Map<String, dynamic> json) {
    return _$SpCreateAccountValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$SpCreateAccountValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SpCreateAccountValueToJson(this);
  }
}
