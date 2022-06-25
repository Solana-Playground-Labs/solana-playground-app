/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_dart/src/solana/key.dart';

class AccountMeta {
  final PublicKey pubkey;
  final bool isSigner;
  final bool isWritable;

  const AccountMeta({
    required this.pubkey,
    required this.isSigner,
    required this.isWritable,
  });

  @override
  List<Object> get props => [pubkey, isSigner, isWritable];
}
