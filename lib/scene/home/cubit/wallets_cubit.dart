import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';

part 'wallets_state.dart';

class WalletsCubit extends Cubit<WalletsState> {
  final WalletRepository walletRepository;
  StreamSubscription? _subscription;

  WalletsCubit(this.walletRepository)
      : super(WalletsState(
          isFetching: false,
          wallets: walletRepository.data,
        )) {
    _subscription = walletRepository.onChange.stream.listen((event) {
      emit(state.copyWith(wallets: event));
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
