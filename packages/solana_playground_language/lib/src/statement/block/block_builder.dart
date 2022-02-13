import 'package:solana_playground_language/extensions/extensions.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class BlockBuilder extends StatementBuilder {
  final List<StatementBuilder> _statementBuilders;

  BlockBuilder({required List<StatementBuilder> statementBuilders}) : _statementBuilders = statementBuilders;

  List<StatementBuilder> get statements => List.of(_statementBuilders);

  void insert(int at, StatementBuilder statementBuilder) {
    if (at < 0 || at > _statementBuilders.length) return;
    _statementBuilders.insert(at, statementBuilder);
    notifyListeners();
  }

  void add(StatementBuilder statementBuilder) {
    _statementBuilders.add(statementBuilder);
    notifyListeners();
  }

  void remove(StatementBuilder statementBuilder) {
    _statementBuilders.remove(statementBuilder);
    notifyListeners();
  }

  void moveTo(StatementBuilder builder, int index) {
    if (_statementBuilders.moveTo(builder, index)) notifyListeners();
  }

  StatementBuilder copy() {
    return BlockBuilder(statementBuilders: statements);
  }

  @override
  BaseStatement get statement => BlockStatement(statements: _statementBuilders.map((e) => e.statement).toList());
}
