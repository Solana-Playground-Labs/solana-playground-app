import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/src/sp_function.dart';

enum SPPackageType { application, library }

class SPPackage extends Equatable {
  final SPPackageType packageType;
  final List<SPFunction> functions;

  const SPPackage({required this.packageType, required this.functions});

  @override
  List<Object> get props => [packageType, functions];
}