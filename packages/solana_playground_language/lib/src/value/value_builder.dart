import 'package:solana_playground_language/solana_playground_language.dart';

import 'constant/constant_builder.dart';
import 'variable/variable_builder.dart';

class ValueContainerBuilder extends BaseBuilder {
  ValueBuilder _valueBuilder;

  ValueContainerBuilder(ValueBuilder valueBuilder) : _valueBuilder = valueBuilder;

  factory ValueContainerBuilder.standard() {
    return ValueContainerBuilder(ConstantValueBuilder(""));
  }

  factory ValueContainerBuilder.variable() {
    return ValueContainerBuilder(VariableValueBuilder(""));
  }

  ValueBuilder get valueBuilder => _valueBuilder;

  set valueBuilder(ValueBuilder value) {
    _valueBuilder = value;
    notifyListeners();
  }

  @override
  ValueContainerBuilder copy() {
    return ValueContainerBuilder(_valueBuilder);
  }
}

abstract class ValueBuilder extends BaseBuilder {
  BaseValue get value;
}
