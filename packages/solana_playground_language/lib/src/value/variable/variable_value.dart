import 'package:solana_playground_language/src/type/internal_type.dart';
import 'package:solana_playground_language/src/value/base_value.dart';

class VariableValue extends BaseValue {
  final String name;

  const VariableValue(this.name);
}
