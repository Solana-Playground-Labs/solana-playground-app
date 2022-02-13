import 'package:solana_playground_language/solana_playground_language.dart';

import '../block/block_statement.dart';

class IfStatement extends BaseStatement {
  final BaseStatement condition;
  final BlockStatement trueBlock;
  final BlockStatement falseBlock;

  const IfStatement({required this.condition, required this.trueBlock, required this.falseBlock});

  @override
  List<Object> get props => [condition, trueBlock, falseBlock];
}
