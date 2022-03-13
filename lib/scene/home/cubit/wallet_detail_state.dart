part of 'wallet_detail_cubit.dart';

class WalletDetailState extends Equatable {
  final bool isFetching;
  final String? address;
  final Account? account;

  const WalletDetailState({
    this.isFetching = false,
    this.address,
    this.account,
  });

  @override
  List<Object?> get props => [isFetching, address, account];

  WalletDetailState removeAccount() => WalletDetailState(
        isFetching: isFetching,
        address: address,
      );

  WalletDetailState copyWith({
    bool? isFetching,
    String? address,
    Account? account,
  }) {
    return WalletDetailState(
      isFetching: isFetching ?? this.isFetching,
      address: address ?? this.address,
      account: account ?? this.account,
    );
  }
}
