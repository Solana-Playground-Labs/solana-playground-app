/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:solana_dart/src/solana/account_meta.dart';
import 'package:solana_dart/src/solana/key.dart';

class TransactionInstruction extends Equatable {
  final PublicKey programID;
  final List<AccountMeta> accountMeta;
  final Uint8List data;

  const TransactionInstruction({
    required this.programID,
    required this.accountMeta,
    required this.data,
  });

  @override
  List<Object> get props => [programID, accountMeta, data];
}