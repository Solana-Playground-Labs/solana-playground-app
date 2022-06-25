/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

class Keypair {
  final List<int> publicKey;
  final List<int> privateKey;

  const Keypair({
    required this.publicKey,
    required this.privateKey,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Keypair &&
          runtimeType == other.runtimeType &&
          publicKey == other.publicKey;

  @override
  int get hashCode => publicKey.hashCode;
}

class SPKeypairProvider {
  final Map<String, Keypair> _keypairs;

  const SPKeypairProvider({
    required Map<String, Keypair> keypairs,
  }) : _keypairs = keypairs;

  Future<Keypair> get(String name) async {
    return _keypairs[name]!;
  }
}
