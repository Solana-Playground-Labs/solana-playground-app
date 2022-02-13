import 'package:solana_playground_language/solana_playground_language.dart';

import '../block/block_statement.dart';

class WhileStatement extends BaseStatement {
  final BaseStatement condition;
  final BlockStatement block;

  const WhileStatement({required this.condition, required this.block});

  @override
  List<Object> get props => [condition, block];
}
