import 'package:flutter/widgets.dart';
import 'package:solana_playground_language/src/statement/statement.dart';
import 'package:solana_playground_language/src/statement_builder/statement_builder.dart';

abstract class Program {
  List<Statement> get statements;
}

abstract class ProgramBuilder extends ChangeNotifier {
  List<StatementBuilder> get statements;

  Program build();
}

class ProgramBuilderImpl extends ProgramBuilder {
  final List<StatementBuilder> _statements = [];

  @override
  List<StatementBuilder> get statements => List.of(_statements);

  void insert(int at, StatementBuilder statementBuilder) {
    _statements.insert(at, statementBuilder);
    notifyListeners();
  }

  void add(StatementBuilder statementBuilder) {
    _statements.add(statementBuilder);
    notifyListeners();
  }

  @override
  Program build() {
    throw UnimplementedError();
  }
}
