/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

class SPWalletProvider {
  final Map<String, dynamic> _wallets;

  const SPWalletProvider({
    required Map<String, dynamic> wallets,
  }) : _wallets = wallets;

  Future<dynamic> get(String name) async {
    return _wallets[name];
  }

}