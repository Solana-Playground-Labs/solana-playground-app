/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'sp_assign_value.builder.dart';

@ValueBuildable()
class SpAssignValue extends Value {
  @ValuePropertyBuildable()
  final Expression accountPubkey;

  @ValuePropertyBuildable()
  final Expression owner;

  const SpAssignValue({
    required this.accountPubkey,
    required this.owner,
  });

  @override
  List<Object> get props => [accountPubkey, owner];

  factory SpAssignValue.fromJson(Map<String, dynamic> json) {
    return _$SpAssignValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$SpAssignValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SpAssignValueToJson(this);
  }
}
