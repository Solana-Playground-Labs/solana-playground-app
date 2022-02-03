import 'package:solana_playground_language/src/statement/declare_variable_statement.dart';
import 'package:solana_playground_language/src/type/type.dart';
import 'package:solana_playground_language/src/value/value.dart';
import 'package:uuid/uuid.dart';

import 'statement_builder.dart';

class DeclareVariableBuilder extends StatementBuilder {
  DeclareVariableBuilder(this._statement) : id = const Uuid().v4();

  factory DeclareVariableBuilder.standard() {
    return DeclareVariableBuilder(DeclareVariableStatement(
      name: "",
      type: const InternalString(),
      value: ConstantValue.string(""),
    ));
  }

  @override
  final String id;

  DeclareVariableStatement _statement;

  DeclareVariableStatement get statement => _statement;

  DeclareVariableBuilder setName(String name, {bool notify = false}) {
    _statement = _statement.copyWith(name: name);
    notifyListeners();
    return this;
  }

  DeclareVariableBuilder setType(InternalType type, {bool notify = false}) {
    _statement = _statement.copyWith(type: type);
    notifyListeners();
    return this;
  }

  DeclareVariableBuilder setValue(Value value, {bool notify = false}) {
    _statement = _statement.copyWith(value: value);
    notifyListeners();
    return this;
  }
}
