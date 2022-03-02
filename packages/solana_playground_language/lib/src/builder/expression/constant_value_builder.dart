import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/expression/constant_value.dart';

class ConstantValueBuilder extends ValueBuilder {
  dynamic _value;

  ConstantValueBuilder({dynamic value}): _value = value;

  dynamic get value => _value;

  set value(dynamic value) {
    _value = value;
    notifyListeners();
  }


  @override
  ConstantValue build() {
    return ConstantValue(value: value);
  }

  @override
  ConstantValueBuilder clone() {
    return ConstantValueBuilder(value: value);
  }
}
