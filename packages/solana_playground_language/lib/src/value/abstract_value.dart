import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/src/type/type.dart';

abstract class Value extends Equatable {
  final InternalType type;

  const Value(this.type);

  @override
  List<Object> get props => [type];
}
