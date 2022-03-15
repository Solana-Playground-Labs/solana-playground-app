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

  SPPackageBuilder asBuilder() {
    return SPPackageBuilder(
      name: name,
      packageType: packageType,
      functionBuilders: scripts.map((e) => e.asBuilder()).toList(),
    );
  }
}

class SPPackageBuilder extends Builder {
  String name;
  PackageType _packageType;
  List<ScriptBuilder> _functionBuilders;

  SPPackageBuilder({
    required this.name,
    required PackageType packageType,
    required List<ScriptBuilder> functionBuilders,
  })  : _packageType = packageType,
        _functionBuilders = functionBuilders;

  @override
  SPPackageBuilder clone() {
    return SPPackageBuilder(
      name: name,
      packageType: packageType,
      functionBuilders: functionBuilders,
    );
  }

  List<ScriptBuilder> get functionBuilders => _functionBuilders;

  set functionBuilders(List<ScriptBuilder> value) {
    _functionBuilders = value;
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
        scripts: _functionBuilders.map((e) => e.build()).toList());
  }
}
