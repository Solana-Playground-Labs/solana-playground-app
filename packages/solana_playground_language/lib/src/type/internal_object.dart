import 'internal_type.dart';

class InternalObject extends InternalType {
  final ObjectSchema schema;

  const InternalObject(this.schema);

  @override
  List<Object> get props => [schema];
}

abstract class ObjectSchema {
  const ObjectSchema();
}

class AnyObjectSchema extends ObjectSchema {}

class TransactionSchema extends ObjectSchema {
  const TransactionSchema();
}
