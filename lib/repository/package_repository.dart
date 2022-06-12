/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:collection/collection.dart';

class PackageRepository {
  List<Package> packages = [];

  final StreamController<List<Package>> _stream = StreamController.broadcast();

  Stream<List<Package>> get onChange => _stream.stream;

  Future<void> initialize(BuildContext context) async {
    final localDocument = await getApplicationDocumentsDirectory();
    for (final entity in await localDocument.list().toList()) {
      if (entity is File && entity.path.endsWith('.json')) {
        try {
          final data = const JsonDecoder().convert(await entity.readAsString());
          final package = Package.fromJson(data);
          packages.add(package);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }

    _flush();
    _stream.add(packages);
  }

  void createPackage(String name) {
    final package = Package(
      name: name,
      icon: SPIcon(
        shortName: name.substring(0, min(3, name.length)),
        backgroundColor: 4280391411,
        foregroundColor: 4294967295,
      ),
      packageType: PackageType.application,
      scripts: [Script.main()],
    );

    packages.add(package);
    _flush();
    _stream.add(packages);
  }

  void addPackage(Package package) {
    packages.add(package);
    _flush();
    _stream.add(packages);
  }

  void save(Package package) {
    packages = packages.where((e) => e.name != package.name).toList();
    packages.add(package);

    _flush();
    _stream.add(packages);
  }

  bool contain(String packageName) {
    return packages.firstWhereOrNull((e) => e.name == packageName) != null;
  }

  void remove(String packageName) async {
    final localDocument = await getApplicationDocumentsDirectory();
    final file = File('${localDocument.path}/$packageName.json');
    if (await file.exists()) {
      await file.delete();
    }

    packages = packages.where((e) => e.name != packageName).toList();
    _stream.add(packages);
  }

  void import(String json) {
    final package = Package.fromJson(jsonDecode(json));
    packages.add(package);

    _flush();
    _stream.add(packages);
  }

  void _flush() async {
    for (final package in packages) {
      final rawData = const JsonEncoder().convert(package.toJson());
      final localDocument = await getApplicationDocumentsDirectory();
      final file = File('${localDocument.path}/${package.name}.json');
      await file.writeAsString(rawData);
    }
  }

  Future<void> dispose() async {
    await _stream.close();
  }
}
