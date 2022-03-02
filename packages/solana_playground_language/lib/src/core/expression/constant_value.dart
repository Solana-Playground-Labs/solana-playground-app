import 'package:solana_playground_language/src/core/expression/value.dart';

class ConstantValue extends Value {
  final String value;

  const ConstantValue({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}