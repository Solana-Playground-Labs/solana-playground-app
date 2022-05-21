/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'expression_inspector_cubit.dart';

class ExpressionInspectorState extends Equatable {
  final ValueBuilder valueBuilder;

  const ExpressionInspectorState({required this.valueBuilder});

  @override
  List<Object> get props => [valueBuilder];

  ExpressionInspectorState copyWith({
    ValueBuilder? valueBuilder,
  }) {
    return ExpressionInspectorState(
      valueBuilder: valueBuilder ?? this.valueBuilder,
    );
  }
}