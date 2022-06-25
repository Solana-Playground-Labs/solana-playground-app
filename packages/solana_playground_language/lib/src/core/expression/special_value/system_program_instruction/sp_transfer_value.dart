/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sp_transfer_value.builder.dart';

@ValueBuildable()
class SpTransferValue extends Value {
  @ValuePropertyBuildable()
  final Expression fromPubkey;

  @ValuePropertyBuildable()
  final Expression toPubkey;

  @ValuePropertyBuildable()
  final Expression lamports;

  const SpTransferValue({
    required this.fromPubkey,
    required this.toPubkey,
    required this.lamports,
  });

  @override
  List<Object> get props => [fromPubkey, toPubkey, lamports];

  factory SpTransferValue.fromJson(Map<String, dynamic> json) {
    return _$SpTransferValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$SpTransferValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SpTransferValueToJson(this);
  }
}
