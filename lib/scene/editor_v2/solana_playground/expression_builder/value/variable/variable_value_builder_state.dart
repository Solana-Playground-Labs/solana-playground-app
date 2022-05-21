/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'variable_value_builder_cubit.dart';

class VariableValueBuilderState extends Equatable {
  final String variable;

  const VariableValueBuilderState({required this.variable});

  @override
  List<Object> get props => [variable];

  VariableValueBuilderState copyWith({String? variable}) {
    return VariableValueBuilderState(variable: variable ?? this.variable);
  }
}
