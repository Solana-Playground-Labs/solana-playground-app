import 'package:solana_playground_language/solana_playground_language.dart';

class VariableValueBuilder extends ValueBuilder {
  String _name;

  VariableValueBuilder(String constant) : _name = constant;

  String get name => _name;

  set name(dynamic value) {
    _name = value;
    notifyListeners();
  }

  @override
  BaseValue get value {
    return VariableValue(name);
  }

  @override
  VariableValueBuilder copy() {
    return VariableValueBuilder(_name);
  }
}
