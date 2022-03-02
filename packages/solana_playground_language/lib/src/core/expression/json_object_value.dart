import 'package:solana_playground_language/src/core/expression/value.dart';

class JsonObjectValue extends Value {
  final dynamic data;

  const JsonObjectValue({required this.data});

  @override
  List<Object> get props => [data];
}
