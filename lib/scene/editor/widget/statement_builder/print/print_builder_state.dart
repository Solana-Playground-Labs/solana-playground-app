part of 'print_builder_widget.dart';

class _PrintBuilderState extends Equatable {
  final List<ValueRootBuilder> valueRootBuilders;

  const _PrintBuilderState({required this.valueRootBuilders});

  @override
  List<Object> get props => [valueRootBuilders];

  _PrintBuilderState copyWith({
    List<ValueRootBuilder>? valueRootBuilders,
  }) {
    return _PrintBuilderState(
      valueRootBuilders: valueRootBuilders ?? this.valueRootBuilders,
    );
  }
}