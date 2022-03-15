import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/expression/unknown_value.dart';

class UnknownValueBuilder extends ValueBuilder {
  final dynamic rawData;

  UnknownValueBuilder({
    required this.rawData,
  });

  @override
  Value build() {
    return UnknownValue(rawData: rawData);
  }

  @override
  ValueBuilder clone() {
    return UnknownValueBuilder(rawData: rawData);
  }
}