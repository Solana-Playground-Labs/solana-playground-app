import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/sp_function.dart';

enum SPPackageType { application, library }

class SPPackage extends Equatable {
  final SPPackageType packageType;
  final List<SPFunction> functions;

  const SPPackage({required this.packageType, required this.functions});

  @override
  List<Object> get props => [packageType, functions];
}

class SPPackageBuilder extends BaseBuilder {
  SPPackageType _packageType;
  List<SPFunctionBuilder> _functionBuilders;

  SPPackageBuilder({
    required SPPackageType packageType,
    required List<SPFunctionBuilder> functionBuilders,
  })  : _packageType = packageType,
        _functionBuilders = functionBuilders;


  SPPackageType get packageType => _packageType;

  List<SPFunctionBuilder> get functionBuilders => _functionBuilders;

  @override
  BaseBuilder copy() {
    return SPPackageBuilder(packageType: packageType, functionBuilders: functionBuilders);
  }
}