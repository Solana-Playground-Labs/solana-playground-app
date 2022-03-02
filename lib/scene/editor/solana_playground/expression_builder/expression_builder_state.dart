part of 'expression_builder_cubit.dart';

class ExpressionBuilderState extends Equatable {
  final ValueBuilder valueBuilder;

  const ExpressionBuilderState({required this.valueBuilder});

  @override
  List<Object> get props => [valueBuilder];

  ExpressionBuilderState copyWith({
    ValueBuilder? valueBuilder,
  }) {
    return ExpressionBuilderState(
      valueBuilder: valueBuilder ?? this.valueBuilder,
    );
  }
}