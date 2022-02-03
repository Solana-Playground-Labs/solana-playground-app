import 'package:solana_playground_language/solana_playground_language.dart';

class InternalTypeHelper {
  static List<InternalType> get primitives => const [
        InternalBool(),
        InternalString(),
        InternalNumber(),
      ];
}
