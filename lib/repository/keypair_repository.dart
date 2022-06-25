import 'dart:async';
import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:solana/solana.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solana_playground_app/model/keypair.dart';
import 'package:solana_playground_app/model/mnemonic.dart';

class KeypairRepository {
  final _storage = const FlutterSecureStorage();
  static const storageKey = "keypairs";

  List<Keypair> _data = [];

  List<Keypair> get data => _data;

  final StreamController<List<Keypair>> _stream = StreamController.broadcast();

  StreamController<List<Keypair>> get onChange => _stream;

  Future<void> initialize() async {
    final rawData = await _storage.read(key: storageKey) ?? "[]";
    _data = List.castFrom(
      jsonDecode(rawData).map((e) => Keypair.fromJson(e)).toList(),
    );
    _stream.add(_data);

    if (_data.isEmpty) {
      importMnemonic("way brick valid put rule curve rookie second perfect drama enrich demise",
          "demo_wallet_1");

      importMnemonic(
        "seminar copy situate okay number stereo elite drink wolf best mesh throw",
        "demo_wallet_2",
      );
    }
  }

  Future<void> _save() async {
    try {
      final data = jsonEncode(_data.map((e) => e.toJson()).toList());
      await _storage.write(key: storageKey, value: data);
    } finally {
      _stream.add(_data);
    }
  }

  Future<void> generateWithMnemomic(String name, {int account = 0, int change = 0}) async {
    final mnemonic = bip39.generateMnemonic();
    final keyPair = await Ed25519HDKeyPair.fromMnemonic(
      mnemonic,
      account: account,
      change: change,
    );

    final wallet = Keypair(
      name: name,
      publicKey: keyPair.publicKey.bytes,
      privateKey: (await keyPair.extract()).bytes,
      mnemonic: Mnemonic(phrase: mnemonic, account: account, change: change),
    );

    _data.add(wallet);
    await _save();
  }

  String generateMnemomic() {
    return bip39.generateMnemonic();
  }

  Future<void> removeWallet(Keypair keypair) async {
    _data.remove(keypair);
    await _save();
  }

  Future<void> importMnemonic(
    String mnemonic,
    String name, {
    int account = 0,
    int change = 0,
  }) async {
    final keyPair = await Ed25519HDKeyPair.fromMnemonic(
      mnemonic,
      account: account,
      change: change,
    );

    final keypair = Keypair(
      name: name,
      publicKey: keyPair.publicKey.bytes,
      privateKey: (await keyPair.extract()).bytes,
      mnemonic: Mnemonic(
        phrase: mnemonic,
        account: account,
        change: change,
      ),
    );

    _data.add(keypair);

    await _save();
  }

  Future<void> dispose() async {
    await _stream.close();
  }
}
