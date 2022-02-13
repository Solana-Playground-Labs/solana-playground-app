import 'package:solana_playground_language/solana_playground_language.dart';

class VariableValue extends BaseValue {
  @override
  InternalType get returnType => const InternalDynamic();

  final String name;

  const VariableValue(this.name);
}
