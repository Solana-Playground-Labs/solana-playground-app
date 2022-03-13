import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/repository/wallet_repository.dart';

part 'wallet_detail_state.dart';

class WalletDetailCubit extends Cubit<WalletDetailState> {
  final SolanaClient client;
  final Wallet wallet;

  WalletDetailCubit(this.client, this.wallet)
      : super(const WalletDetailState());

  Future<void> fetch() async {
    if (state.isFetching) return;
    try {
      emit(state.copyWith(isFetching: true));
      final address = await wallet.address;
      emit(state.copyWith(address: address));

      final account = await client.rpcClient.getAccountInfo(address);
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
