import 'package:solana_playground_language/src/type/internal_null.dart';
import 'package:solana_playground_language/src/value/abstract_value.dart';

class NullValue extends Value {
  const NullValue(): super(const InternalNull());
}