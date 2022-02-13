import 'package:solana_playground_language/src/type/type.dart';

import '../base_value.dart';

class ConstantValue extends BaseValue {
  final dynamic constant;

  const ConstantValue({required this.constant}) : super();

  factory ConstantValue.string(String value) {
    return ConstantValue(constant: value);
  }
}
