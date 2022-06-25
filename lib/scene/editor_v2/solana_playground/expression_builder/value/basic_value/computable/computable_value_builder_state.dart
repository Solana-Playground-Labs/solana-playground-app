/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'computable_value_builder_cubit.dart';

class ComputableValueBuilderState extends Equatable {
  final String value;

  const ComputableValueBuilderState({required this.value});

  @override
  List<Object> get props => [value];

  ComputableValueBuilderState copyWith({
    String? value,
  }) {
    return ComputableValueBuilderState(
      value: value ?? this.value,
    );
  }
}
