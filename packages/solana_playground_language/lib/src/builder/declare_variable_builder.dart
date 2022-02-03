import 'package:solana_playground_language/solana_playground_language.dart';

import 'statement_builder.dart';

class DeclareVariableBuilder extends StatementBuilder {
  DeclareVariableBuilder(String name, InternalType type)
      : _name = name,
        _internalType = type,
        super();

  factory DeclareVariableBuilder.standard() {
    return DeclareVariableBuilder("", const InternalString());
  }

  String _name;
  InternalType _internalType;

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  InternalType get internalType => _internalType;

  set internalType(InternalType value) {
    _internalType = value;
    notifyListeners();
  }

  final ValueRootBuilder valueRootBuilder = ValueRootBuilder.standard();

  DeclareVariableStatement get statement => DeclareVariableStatement(
        name: name,
        type: internalType,
        value: valueRootBuilder.valueBuilder.value,
      );
}
