import 'package:solana_playground_language/src/core/expression/value.dart';

class JsonValue extends Value {
  final dynamic data;

  const JsonValue({required this.data});

  @override
  List<Object> get props => [data];
}
