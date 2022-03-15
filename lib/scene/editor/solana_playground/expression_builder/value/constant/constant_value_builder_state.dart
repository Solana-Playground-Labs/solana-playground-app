/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'constant_value_builder_cubit.dart';

class ConstantValueBuilderState extends Equatable {
  final String value;

  const ConstantValueBuilderState({required this.value});

  @override
  List<Object> get props => [value];

  ConstantValueBuilderState copyWith({
    String? value,
  }) {
    return ConstantValueBuilderState(
      value: value ?? this.value,
    );
  }
}