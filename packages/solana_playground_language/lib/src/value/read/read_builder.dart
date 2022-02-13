import 'package:solana_playground_language/solana_playground_language.dart';

class ReadValueBuilder extends ValueBuilder {
  @override
  BaseValue get value {
    return const ReadValue();
  }

  @override
  ReadValueBuilder copy() {
    return ReadValueBuilder();
  }
}
