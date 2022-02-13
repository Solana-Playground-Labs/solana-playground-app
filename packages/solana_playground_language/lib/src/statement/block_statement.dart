import 'package:solana_playground_language/solana_playground_language.dart';

class BlockStatement extends Statement {
  final List<Statement> statements;

  const BlockStatement({required this.statements});

  @override
  List<Object> get props => [statements];
}
