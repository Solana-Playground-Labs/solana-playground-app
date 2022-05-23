/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'bool_meta_value_cubit.dart';

class BoolMetaValueState extends Equatable {
  final bool value;

  const BoolMetaValueState({required this.value});

  @override
  List<Object> get props => [value];

  BoolMetaValueState copyWith({
    bool? value,
  }) {
    return BoolMetaValueState(
      value: value ?? this.value,
    );
  }
}