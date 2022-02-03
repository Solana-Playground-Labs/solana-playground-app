import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/src/type/type.dart';

abstract class Statement extends Equatable {
  InternalType get returnType;

  const Statement();

  @override
  List<Object> get props => [];
}
