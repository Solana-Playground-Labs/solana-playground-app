import 'package:flutter/widgets.dart';
import 'package:solana_playground_language/src/statement/statement.dart';
import 'package:solana_playground_language/utils/list_extension.dart';

import 'builder/statement_builder.dart';

abstract class Program {
  List<Statement> get statements;
}

abstract class ProgramBuilder extends ChangeNotifier {
  List<StatementBuilder> get statements;

  void insert(int at, StatementBuilder statementBuilder);

  void add(StatementBuilder statementBuilder);

  void remove(StatementBuilder statementBuilder);

  void moveTo(StatementBuilder builder, int index);

  Program build();
}

class ProgramBuilderImpl extends ProgramBuilder {
  final List<StatementBuilder> _statements = [];

  @override
  List<StatementBuilder> get statements => List.of(_statements);

  @override
  void insert(int at, StatementBuilder statementBuilder) {
    if (at < 0 || at > _statements.length) return;
    _statements.insert(at, statementBuilder);
    notifyListeners();
  }

  @override
  void add(StatementBuilder statementBuilder) {
    _statements.add(statementBuilder);
    notifyListeners();
  }

  @override
  void remove(StatementBuilder statementBuilder) {
    _statements.remove(statementBuilder);
    notifyListeners();
  }

  @override
  void moveTo(StatementBuilder builder, int index) {
    if (_statements.moveTo(builder, index)) notifyListeners();
  }

  @override
  Program build() {
    throw UnimplementedError();
  }
}
