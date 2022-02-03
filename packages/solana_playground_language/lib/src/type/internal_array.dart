import 'internal_type.dart';

class InternalArray extends InternalType {
  final InternalType elementType;

  const InternalArray(this.elementType);
}
