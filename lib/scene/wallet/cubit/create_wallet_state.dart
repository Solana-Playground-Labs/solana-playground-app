part of 'create_wallet_cubit.dart';

class CreateWalletState extends Equatable {
  final String mnemonic;

  const CreateWalletState({
    required this.mnemonic,
  });

  @override
  List<Object> get props => [mnemonic];

  CreateWalletState copyWith({
    String? mnemonic,
  }) {
    return CreateWalletState(
      mnemonic: mnemonic ?? this.mnemonic,
    );
  }
}
