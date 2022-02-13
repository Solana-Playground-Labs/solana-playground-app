import 'package:solana_playground_language/solana_playground_language.dart';

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
  BaseValue get value {
    return ConstantValue(constant: _constant);
  }

  @override
  ConstantValueBuilder copy() {
    return ConstantValueBuilder(_constant);
  }
}
