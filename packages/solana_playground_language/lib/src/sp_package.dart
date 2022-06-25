/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/sp_icon.dart';

import 'builder/core_builder.dart';

enum PackageType { application, library }

class Package extends Equatable {
  final String name;
  final SPIcon icon;
  final PackageType packageType;
  final List<Script> scripts;

  const Package({
    required this.name,
    required this.icon,
    required this.packageType,
    required this.scripts,
  });

  @override
  List<Object> get props => [name, icon, packageType, scripts];

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'],
      icon: SPIcon.fromJson(json['icon']),
      packageType: json['packageType'] == 0 ? PackageType.application : PackageType.library,
      scripts: List.castFrom(
        json['scripts'].map((e) => Script.fromJson(e)).toList(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon.toJson(),
      'type': runtimeType.toString(),
      'packageType': packageType.index,
      'scripts': scripts.map((e) => e.toJson()).toList(),
    };
  }

  PackageBuilder asBuilder() {
    return PackageBuilder(
      name: name,
      icon: icon,
      packageType: packageType,
      scriptBuilders: scripts.map((e) => e.asBuilder()).toList(),
    );
  }
}

class PackageBuilder extends Builder {
  String _name;
  SPIcon _icon;

  PackageType _packageType;
  List<ScriptBuilder> _scriptBuilders;

  PackageBuilder({
    required String name,
    required SPIcon icon,
    required PackageType packageType,
    required List<ScriptBuilder> scriptBuilders,
  })  : _name = name,
        _icon = icon,
        _packageType = packageType,
        _scriptBuilders = scriptBuilders;

  @override
  PackageBuilder clone() {
    return PackageBuilder(
      name: name,
      icon: _icon,
      packageType: packageType,
      scriptBuilders: scriptBuilders,
    );
  }

  SPIcon get icon => _icon;

  set icon(SPIcon value) {
    _icon = value;
    notifyListeners();
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
        icon: icon,
        packageType: _packageType,
        scripts: _scriptBuilders.map((e) => e.build()).toList());
  }
}
