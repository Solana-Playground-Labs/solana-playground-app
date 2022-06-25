/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

class SPKeypairSecurityMemory {
  final Map<List<int>, List<int>> _data = {};

  Future write(List<int> publicKey, List<int> privateKey) async {
    _data[publicKey] = privateKey;
  }

  Future read(List<int> publicKey) async {
    return _data[publicKey];
  }
}
