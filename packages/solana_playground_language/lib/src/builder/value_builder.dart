import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/builder/base_builder.dart';

class ValueRootBuilder extends BaseBuilder {
  ValueBuilder _valueBuilder;

  ValueRootBuilder(ValueBuilder valueBuilder) : _valueBuilder = valueBuilder;

  factory ValueRootBuilder.standard() {
    return ValueRootBuilder(ConstantValueBuilder(""));
  }

  factory ValueRootBuilder.variable() {
    return ValueRootBuilder(VariableValueBuilder(""));
  }

  ValueBuilder get valueBuilder => _valueBuilder;

  set valueBuilder(ValueBuilder value) {
    _valueBuilder = value;
    notifyListeners();
  }

  @override
  ValueRootBuilder copy() {
    return ValueRootBuilder(_valueBuilder);
  }
}

abstract class ValueBuilder extends BaseBuilder {
  Value get value;
}

class ConstantValueBuilder extends ValueBuilder {
  dynamic _constant;

  ConstantValueBuilder(dynamic constant) : _constant = constant;

  factory ConstantValueBuilder.standard() => ConstantValueBuilder("");

  dynamic get constant => _constant;

  set constant(dynamic value) {
    _constant = value;
    notifyListeners();
  }

  @override
  Value get value {
    return ConstantValue(constant: _constant);
  }

  @override
  ConstantValueBuilder copy() {
    return ConstantValueBuilder(_constant);
  }
}

class VariableValueBuilder extends ValueBuilder {
  String _name;

  VariableValueBuilder(String constant) : _name = constant;

  String get name => _name;

  set name(dynamic value) {
    _name = value;
    notifyListeners();
  }

  @override
  Value get value {
    return VariableValue(name);
  }

  @override
  VariableValueBuilder copy() {
    return VariableValueBuilder(_name);
  }
}

class ReadValueBuilder extends ValueBuilder {
  @override
  Value get value {
    return const ReadValue();
  }

  @override
  ReadValueBuilder copy() {
    return ReadValueBuilder();
  }
}
