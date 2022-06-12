/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'keypairs_cubit.dart';

class WalletsState extends Equatable {
  final bool isFetching;
  final List<Keypair> keypairs;

  const WalletsState({
    required this.isFetching,
    required this.keypairs,
  });

  @override
  List<Object> get props => [isFetching, keypairs];

  WalletsState copyWith({
    bool? isFetching,
    List<Keypair>? keypairs,
  }) {
    return WalletsState(
      isFetching: isFetching ?? this.isFetching,
      keypairs: keypairs ?? this.keypairs,
    );
  }
}
