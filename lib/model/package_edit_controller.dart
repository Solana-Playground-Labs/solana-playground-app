/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_language/lib.dart';

class PackageEditController {
  final PackageRepository packageRepository;

  final PackageBuilder currentBuilder;

  String _packageName;
  Timer? _savingTimer;

  PackageEditController({
    required this.packageRepository,
    required this.currentBuilder,
  }) : _packageName = currentBuilder.name {
    _savingTimer = Timer.periodic(const Duration(minutes: 1), (timer) => save());
  }

  factory PackageEditController.parse(
    Package package, {
    required PackageRepository packageRepository,
  }) =>
      PackageEditController(
        packageRepository: packageRepository,
        currentBuilder: package.asBuilder(),
      );

  Future<void> save() async {
    final package = currentBuilder.build();

    packageRepository.save(package);
    if (_packageName != package.name) {
      packageRepository.remove(_packageName);
      _packageName = package.name;
    }
  }

  void dispose() {
    _savingTimer?.cancel();
  }
}
