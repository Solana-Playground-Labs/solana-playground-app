import 'package:solana_playground_language/solana_playground_language.dart';

enum ValueSourceType {
  read,
  constant,
  variable,
  unknown,
}

class ValueSource {
  static String sourceTypeToString(ValueSourceType sourceType) {
    switch (sourceType) {
      case ValueSourceType.read:
        return "Input";
      case ValueSourceType.constant:
        return "Constant";
      case ValueSourceType.variable:
        return "Variable";
      case ValueSourceType.unknown:
        return "Unknown";
    }
  }

  static ValueSourceType valueBuilderToSourceType(ValueBuilder builder) {
    switch (builder.runtimeType) {
      case ConstantValueBuilder:
        return ValueSourceType.constant;
      case VariableValueBuilder:
        return ValueSourceType.variable;
      case ReadValueBuilder:
        return ValueSourceType.read;

      default:
        return ValueSourceType.unknown;
    }
  }

  static ValueBuilder sourceTypeToValueBuilder(ValueSourceType sourceType) {
    switch (sourceType) {
      case ValueSourceType.read:
        return ReadValueBuilder();
      case ValueSourceType.variable:
        return VariableValueBuilder("");
      case ValueSourceType.constant:
        return ConstantValueBuilder.standard();
      case ValueSourceType.unknown:
        return ConstantValueBuilder.standard();
    }
  }

  static const all = [
    ValueSourceType.read,
    ValueSourceType.constant,
    ValueSourceType.variable,
  ];
}
