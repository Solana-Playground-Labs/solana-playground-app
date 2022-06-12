/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'solana_network_cubit.dart';

class SolanaNetworkState extends Equatable {
  final List<SolanaNetwork> networks;
  final SolanaNetwork selected;

  const SolanaNetworkState({
    required this.networks,
    required this.selected,
  });

  SolanaNetworkState copyWith({
    List<SolanaNetwork>? networks,
    SolanaNetwork? selected,
  }) {
    return SolanaNetworkState(
      networks: networks ?? this.networks,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object> get props => [networks, selected];
}
