/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'airdrop_cubit.dart';

class AirdropState extends Equatable {
  final bool isFetching;

  const AirdropState({this.isFetching = false});

  @override
  List<Object> get props => [isFetching];

  AirdropState copyWith({
    bool? isFetching,
  }) {
    return AirdropState(
      isFetching: isFetching ?? this.isFetching,
    );
  }
}

