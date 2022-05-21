/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'builder/core_builder.dart';

enum PackageType { application, library }

class Package extends Equatable {
  final String name;
  final PackageType packageType;
  final List<Script> scripts;

  const Package({
    required this.name,
    required this.packageType,
    required this.scripts,
  });

  @override
  List<Object> get props => [packageType, scripts];

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'],
      packageType: json['packageType'] == 0
          ? PackageType.application
          : PackageType.library,
      scripts: List.castFrom(
        json['scripts'].map((e) => Script.fromJson(e)).toList(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': runtimeType.toString(),
      'packageType': packageType.index,
      'scripts': scripts.map((e) => e.toJson()).toList(),
    };
  }

  PackageBuilder asBuilder() {
    return PackageBuilder(
      name: name,
      packageType: packageType,
      scriptBuilders: scripts.map((e) => e.asBuilder()).toList(),
    );
  }
}

class PackageBuilder extends Builder {
  String _name;

  PackageType _packageType;
  List<ScriptBuilder> _scriptBuilders;

  PackageBuilder({
    required String name,
    required PackageType packageType,
    required List<ScriptBuilder> scriptBuilders,
  })  : _name = name,
        _packageType = packageType,
        _scriptBuilders = scriptBuilders;

  @override
  PackageBuilder clone() {
    return PackageBuilder(
      name: name,
      packageType: packageType,
      scriptBuilders: scriptBuilders,
    );
  }

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  List<ScriptBuilder> get scriptBuilders => _scriptBuilders;

  set scriptBuilders(List<ScriptBuilder> value) {
    _scriptBuilders = value;
    notifyListeners();
  }

  PackageType get packageType => _packageType;

  set packageType(PackageType value) {
    _packageType = value;
    notifyListeners();
  }

  Package build() {
    return Package(
        name: name,
        packageType: _packageType,
        scripts: _scriptBuilders.map((e) => e.build()).toList());
  }
}
