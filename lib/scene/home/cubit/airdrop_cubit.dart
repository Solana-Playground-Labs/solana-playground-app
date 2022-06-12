/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/model/keypair.dart';

part 'airdrop_state.dart';

class AirdropCubit extends Cubit<AirdropState> {
  final amountInput = TextEditingController();
  final SolanaClient client;
  final Keypair keypair;

  AirdropCubit(this.client, this.keypair) : super(const AirdropState());

  Future<void> submit() async {
    if (state.isFetching) return;

    try {
      emit(state.copyWith(isFetching: true));

      final String signature = await client.rpcClient
          .requestAirdrop(keypair.publicKeyBase58, int.parse(amountInput.text));
      await client.waitForSignatureStatus(signature,
          status: Commitment.finalized);
    } finally {
      emit(state.copyWith(isFetching: false));
    }
  }
}
