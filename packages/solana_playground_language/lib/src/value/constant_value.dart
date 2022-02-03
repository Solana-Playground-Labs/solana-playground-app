import 'package:solana_playground_language/src/type/type.dart';

import 'abstract_value.dart';

class ConstantValue extends Value {
  final dynamic constant;

  const ConstantValue({required InternalType type, required this.constant}) : super(type);

  factory ConstantValue.string(String value) {
    return ConstantValue(type: const InternalString(), constant: value);
  }
}
