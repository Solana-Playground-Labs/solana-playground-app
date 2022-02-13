part of 'print_builder_cubit.dart';

class PrintBuilderState extends Equatable {
  final List<ValueContainerBuilder> valueRootBuilders;

  const PrintBuilderState({required this.valueRootBuilders});

  @override
  List<Object> get props => [valueRootBuilders];

  PrintBuilderState copyWith({
    List<ValueContainerBuilder>? valueRootBuilders,
  }) {
    return PrintBuilderState(
      valueRootBuilders: valueRootBuilders ?? this.valueRootBuilders,
    );
  }
}
