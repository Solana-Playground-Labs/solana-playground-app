import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class SPFunction extends Equatable {
  final String name;
  final BlockStatement blockStatement;
  final InternalType returnType;

  const SPFunction({required this.name, required this.blockStatement, required this.returnType});

  @override
  List<Object> get props => [name, blockStatement, returnType];
}

class SPFunctionBuilder extends BaseBuilder {
  final String _name;
  final BlockBuilder _blockBuilder;
  final InternalType _returnType;

  SPFunctionBuilder({required String name, required BlockBuilder blockBuilder, required InternalType returnType})
      : _name = name,
        _blockBuilder = blockBuilder,
        _returnType = returnType;


  String get name => _name;

  BlockBuilder get blockBuilder => _blockBuilder;

  InternalType get returnType => _returnType;

  @override
  BaseBuilder copy() {
    return SPFunctionBuilder(name: name, blockBuilder: blockBuilder, returnType: returnType);
  }
}
