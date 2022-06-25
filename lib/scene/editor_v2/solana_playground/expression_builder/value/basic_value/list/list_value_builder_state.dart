/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'list_value_builder_cubit.dart';

class ListValueBuilderState extends Equatable {
  final List<ExpressionBuilder> expressions;

  const ListValueBuilderState({this.expressions = const []});

  @override
  List<Object> get props => [expressions];

  ListValueBuilderState copyWith({
    List<ExpressionBuilder>? expressions,
  }) {
    return ListValueBuilderState(
      expressions: expressions ?? this.expressions,
    );
  }
}
