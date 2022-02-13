import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/src/type/type.dart';

abstract class BaseStatement extends Equatable {
  InternalType get returnType => const InternalVoid();

  const BaseStatement();

  @override
  List<Object> get props => [];
}
