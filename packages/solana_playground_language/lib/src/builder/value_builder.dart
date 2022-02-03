import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/base_builder.dart';

class ValueRootBuilder extends BaseBuilder {
  ValueBuilder _valueBuilder;

  ValueRootBuilder(ValueBuilder valueBuilder) : _valueBuilder = valueBuilder;

  factory ValueRootBuilder.standard() {
    return ValueRootBuilder(ConstantValueBuilder("", const InternalString()));
  }

  ValueBuilder get valueBuilder => _valueBuilder;

  set valueBuilder(ValueBuilder value) {
    _valueBuilder = value;
    notifyListeners();
  }
}

abstract class ValueBuilder extends BaseBuilder {
  Value get value;
}

class ConstantValueBuilder extends ValueBuilder {
  dynamic _constant;

  ConstantValueBuilder(dynamic constant, InternalType type) : _constant = constant;

  dynamic get constant => _constant;

  set value(dynamic value) {
    _constant = value;
    notifyListeners();
  }

  @override
  Value get value {
    return ConstantValue(constant: _constant);
  }
}

class VariableValueBuilder extends ValueBuilder {
  dynamic _name;

  VariableValueBuilder(dynamic constant) : _name = constant;

  dynamic get name => _name;

  set name(dynamic value) {
    _name = value;
    notifyListeners();
  }

  @override
  Value get value {
    return VariableValue(name);
  }
}

class ReadValueBuilder extends ValueBuilder {
  @override
  Value get value {
    return const ReadValue();
  }
}
