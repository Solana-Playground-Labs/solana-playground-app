/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sp_create_nonce_account_value.builder.dart';

@ValueBuildable()
class SpCreateNonceAccountValue extends Value {
  @ValuePropertyBuildable()
  final Expression fromPubkey;

  @ValuePropertyBuildable()
  final Expression noncePubkey;

  @ValuePropertyBuildable()
  final Expression authorizedPubkey;

  @ValuePropertyBuildable()
  final Expression lamports;

  const SpCreateNonceAccountValue({
    required this.fromPubkey,
    required this.noncePubkey,
    required this.authorizedPubkey,
    required this.lamports,
  });

  @override
  List<Object> get props => [
        fromPubkey,
        noncePubkey,
        authorizedPubkey,
        lamports,
      ];

  factory SpCreateNonceAccountValue.fromJson(Map<String, dynamic> json) {
    return _$SpCreateNonceAccountValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$SpCreateNonceAccountValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SpCreateNonceAccountValueToJson(this);
  }
}
