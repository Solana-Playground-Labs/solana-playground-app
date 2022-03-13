import 'dart:async';
import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:solana/solana.dart';

class Wallet extends Equatable {
  final String name;
  final int account;
  final int change;
  final String mnemonic;

  const Wallet({
    required this.name,
    required this.account,
    required this.change,
    required this.mnemonic,
  });

  @override
  List<Object> get props => [name, account, change, mnemonic];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'account': this.account,
      'change': this.change,
      'mnemonic': this.mnemonic,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      name: map['name'] as String,
      account: map['account'] as int,
      change: map['change'] as int,
      mnemonic: map['mnemonic'] as String,
    );
  }
}

class WalletRepository {
  final _storage = const FlutterSecureStorage();
  List<Wallet> _data = [];

  List<Wallet> get data => _data;

  final StreamController<List<Wallet>> _stream = StreamController.broadcast();

  StreamController<List<Wallet>> get onChange => _stream;

  Future<void> initialize() async {
    final rawData = await _storage.read(key: "wallets") ?? "[]";
    _data = jsonDecode(rawData).map((e) => Wallet.fromMap(e));
  }

  Future<void> _save() async {
    final data = jsonEncode(_data.map((e) => e.toMap()));
    await _storage.write(key: "wallets", value: data);
    _stream.add(_data);
  }

  Future<void> generateWithMnemomic(String name,
      {int account = 0, int change = 0}) async {
    final mnemonic = bip39.generateMnemonic();
    final wallet = Wallet(
      name: name,
      mnemonic: mnemonic,
      account: account,
      change: change,
    );
    _data.add(wallet);
    await _save();
  }

  Future<void> removeWallet(Wallet wallet) async {
    _data.remove(wallet);
    await _save();
  }

  Future<void> importMnemonic(
    String mnemonic,
    String name, {
    int account = 0,
    int change = 0,
  }) async {
    final wallet = Wallet(
      name: name,
      mnemonic: mnemonic,
      account: account,
      change: change,
    );
    _data.add(wallet);
    await _save();
  }

  Future<void> dispose() async {
    await _stream.close();
  }
}
