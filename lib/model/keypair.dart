/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:solana/solana.dart';

import 'mnemonic.dart';

part 'keypair.g.dart';

@JsonSerializable()
class Keypair extends Equatable {
  final String name;
  final List<int> publicKey;
  final List<int> privateKey;

  final Mnemonic? mnemonic;

  const Keypair({
    required this.name,
    required this.publicKey,
    required this.privateKey,
    this.mnemonic,
  });

  String get publicKeyBase58 => Ed25519HDPublicKey(publicKey).toBase58();

  factory Keypair.fromJson(Map<String, dynamic> json) => _$KeypairFromJson(json);

  Map<String, dynamic> toJson() => _$KeypairToJson(this);

  @override
  List<Object?> get props => [publicKey, privateKey, mnemonic];
}
