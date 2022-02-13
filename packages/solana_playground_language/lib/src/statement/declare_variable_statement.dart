import 'package:solana_playground_language/src/type/type.dart';
import 'package:solana_playground_language/src/types.dart';
import 'package:solana_playground_language/src/value/value.dart';

import 'abstract_statement.dart';

class DeclareVariablesStatement extends Statement {
  final List<DeclareVariableStatement> variables;

  const DeclareVariablesStatement(this.variables);

  @override
  InternalType get returnType => const InternalVoid();
}

class DeclareVariableStatement extends Statement {
  const DeclareVariableStatement({
    required this.name,
    required this.type,
    required this.value,
  });

  final Variable name;
  final InternalType type;
  final Value value;

  @override
  InternalType get returnType => const InternalVoid();

  @override
  List<Object> get props => [name, type, value];

  DeclareVariableStatement copyWith({
    String? name,
    InternalType? type,
    Value? value,
  }) {
    return DeclareVariableStatement(
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  DeclareVariableStatement setNull() {
    return DeclareVariableStatement(name: name, type: type, value: const NullValue());
  }
}
