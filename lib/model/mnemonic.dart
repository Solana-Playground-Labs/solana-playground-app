/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mnemonic.g.dart';

@JsonSerializable()
class Mnemonic extends Equatable {
  final String phrase;
  final int account;
  final int change;

  const Mnemonic({
    required this.phrase,
    required this.change,
    required this.account,
  });

  @override
  List<Object?> get props => [
        phrase,
        change,
        account,
      ];

  factory Mnemonic.fromJson(Map<String, dynamic> json) => _$MnemonicFromJson(json);

  Map<String, dynamic> toJson() => _$MnemonicToJson(this);
}
