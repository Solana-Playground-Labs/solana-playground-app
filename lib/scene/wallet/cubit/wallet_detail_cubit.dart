/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/model/keypair.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/solana_network_cubit.dart';

part 'wallet_detail_state.dart';

class WalletDetailCubit extends Cubit<WalletDetailState> {
  final SolanaNetworkCubit solanaNetworkCubit;
  final Keypair keypair;

  WalletDetailCubit(this.solanaNetworkCubit, this.keypair) : super(const WalletDetailState());

  Future<void> fetch() async {
    if (state.isFetching) return;
    try {
      emit(state.copyWith(isFetching: true));
      emit(state.copyWith(address: keypair.publicKeyBase58));

      final network = solanaNetworkCubit.state.selected;
      final rpcClient = SolanaClient(
        rpcUrl: Uri.parse(network.rpcURL),
        websocketUrl: Uri.parse(network.socketURL),
      );
      final account = await rpcClient.rpcClient.getAccountInfo(
        keypair.publicKeyBase58,
      );

      if (account == null) {
        emit(state.removeAccount());
      } else {
        emit(state.copyWith(account: account));
      }
    } finally {
      emit(state.copyWith(isFetching: false));
    }
  }
}
