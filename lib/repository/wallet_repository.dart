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

  Future<String> get address async {
    final keyPair = await Ed25519HDKeyPair.fromMnemonic(mnemonic, account: account, change: change);
    return keyPair.address;
  }

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
      'account': account,
      'change': change,
      'mnemonic': mnemonic,
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
    _data = List.castFrom(
        jsonDecode(rawData).map((e) => Wallet.fromMap(e)).toList());
    _stream.add(_data);
  }

  Future<void> _save() async {
    final data = jsonEncode(_data.map((e) => e.toMap()).toList());
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

  String generateMnemomic() {
    return bip39.generateMnemonic();
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
