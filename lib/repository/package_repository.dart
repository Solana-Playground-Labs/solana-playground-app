/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solana_playground_language/lib.dart';

class PackageRepository {
  List<Package> packages = [];

  final StreamController<List<Package>> _stream = StreamController.broadcast();

  Stream<List<Package>> get onChange => _stream.stream;

  Future<void> initialize(BuildContext context) async {
    final data = await DefaultAssetBundle.of(context)
        .loadString("assets/projects/transfer.json");

    packages.add(Package.fromJson(jsonDecode(data)));

    _stream.add(packages);
  }

  void createPackage(String name) {
    final package = Package(
      name: name,
      icon: SPIcon.empty(),
      packageType: PackageType.application,
      scripts: [Script.main()],
    );

    packages.add(package);
    _stream.add(packages);
  }

  void save(Package package) {
    packages = packages.where((e) => e.name != package.name).toList();
    packages.add(package);

    _stream.add(packages);
  }

  void import(String json) {
    final package = Package.fromJson(jsonDecode(json));
    packages.add(package);

    _stream.add(packages);
  }

  Future<void> dispose() async {
    await _stream.close();
  }
}
