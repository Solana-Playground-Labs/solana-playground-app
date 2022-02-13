import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/block_statement.dart';

class SPFunction extends Equatable {
  final String name;
  final BlockStatement blockStatement;
  final InternalType returnType;

  const SPFunction({required this.name, required this.blockStatement, required this.returnType});

  @override
  List<Object> get props => [name, blockStatement, returnType];
}
