/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'conditional_value_builder_cubit.dart';

class ConditionalValueBuilderState extends Equatable {
  final ComparisonOperator comparisonOperator;

  const ConditionalValueBuilderState({
    required this.comparisonOperator,
  });

  @override
  List<Object> get props => [comparisonOperator];

  ConditionalValueBuilderState copyWith({
    ComparisonOperator? comparisonOperator,
  }) {
    return ConditionalValueBuilderState(
      comparisonOperator: comparisonOperator ?? this.comparisonOperator,
    );
  }
}
