/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_app/model/keypair.dart';
import 'package:solana_playground_app/repository/keypair_repository.dart';

part 'keypairs_state.dart';

class KeypairsCubit extends Cubit<WalletsState> {
  final KeypairRepository keypairRepository;
  StreamSubscription? _subscription;

  KeypairsCubit(this.keypairRepository)
      : super(WalletsState(
          isFetching: false,
          keypairs: keypairRepository.data,
        )) {
    _subscription = keypairRepository.onChange.stream.listen((event) {
      emit(state.copyWith(keypairs: List.of(event)));
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
