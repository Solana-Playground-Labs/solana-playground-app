/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/model/solana_network.dart';

part 'solana_network_state.dart';

const List<SolanaNetwork> _networks = [
  SolanaNetwork(
    name: "Testnet",
    rpcURL: "https://api.testnet.solana.com",
    socketURL: "ws://api.testnet.solana.com",
  ),
  SolanaNetwork(
    name: "Devnet",
    rpcURL: "https://api.devnet.solana.com",
    socketURL: "ws://api.devnet.solana.com",
  ),
  SolanaNetwork(
    name: "Mainnet - Solana",
    rpcURL: "https://api.mainnet-beta.solana.com",
    socketURL: "ws://api.mainnet-beta.solana.com",
  ),
  SolanaNetwork(
    name: "Mainnet - Serum",
    rpcURL: "https://solana-api.projectserum.com",
    socketURL: "ws://solana-api.projectserum.com",
  ),
];

class SolanaNetworkCubit extends Cubit<SolanaNetworkState> {
  SolanaNetworkCubit()
      : super(SolanaNetworkState(
          networks: _networks,
          selected: _networks[1],
        ));

  void select(SolanaNetwork item) {
    print(item);
    emit(state.copyWith(selected: item));
  }
}
