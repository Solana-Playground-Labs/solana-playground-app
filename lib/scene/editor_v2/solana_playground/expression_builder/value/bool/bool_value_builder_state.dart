/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'bool_value_builder_cubit.dart';

class BoolValueBuilderState extends Equatable {
  final bool value;

  const BoolValueBuilderState({this.value = false});

  @override
  List<Object> get props => [value];

  BoolValueBuilderState copyWith({
    bool? value,
  }) {
    return BoolValueBuilderState(
      value: value ?? this.value,
    );
  }
}