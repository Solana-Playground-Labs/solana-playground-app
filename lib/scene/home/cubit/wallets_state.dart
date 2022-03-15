/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'wallets_cubit.dart';

class WalletsState extends Equatable {
  final bool isFetching;
  final List<Wallet> wallets;

  const WalletsState({
    required this.isFetching,
    required this.wallets,
  });

  @override
  List<Object> get props => [isFetching, wallets];

  WalletsState copyWith({
    bool? isFetching,
    List<Wallet>? wallets,
  }) {
    return WalletsState(
      isFetching: isFetching ?? this.isFetching,
      wallets: wallets ?? this.wallets,
    );
  }
}
