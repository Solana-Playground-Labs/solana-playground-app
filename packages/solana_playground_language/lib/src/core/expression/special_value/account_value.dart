/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'account_value.builder.dart';

@ValueBuildable()
class AccountValue extends Value {
  @ValuePropertyBuildable()
  final Expression isSigner;

  @ValuePropertyBuildable()
  final Expression isWritable;

  @ValuePropertyBuildable()
  final Expression pubkey;

  const AccountValue({
    required this.isSigner,
    required this.isWritable,
    required this.pubkey,
  });


  @override
  List<Object?> get props => [isSigner, isWritable, pubkey];

  @override
  ValueBuilder asBuilder() {
    return _$AccountValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AccountValueToJson(this);
  }

  factory AccountValue.fromJson(Map<String, dynamic> json) {
    return _$AccountValueFromJson(json);
  }
}
