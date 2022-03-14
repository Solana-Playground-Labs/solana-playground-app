part of 'binary_value_builder_cubit.dart';

class BinaryValueBuilderState extends Equatable {
  final List<ExpressionBuilder> builders;

  const BinaryValueBuilderState({
    required this.builders,
  });

  @override
  List<Object?> get props => [builders];

  BinaryValueBuilderState copyWith({
    List<ExpressionBuilder>? builders,
  }) {
    return BinaryValueBuilderState(
      builders: builders ?? this.builders,
    );
  }
}
