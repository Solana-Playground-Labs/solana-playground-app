import 'package:solana_playground_language/src/type/internal_type.dart';
import 'package:solana_playground_language/src/value/abstract_value.dart';

class VariableValue extends Value {
  final String name;

  const VariableValue(this.name);
}
