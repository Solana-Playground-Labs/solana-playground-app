part of 'print_builder_widget.dart';

class _PrintBuilderState extends Equatable {
  final List<ValueContainerBuilder> valueRootBuilders;

  const _PrintBuilderState({required this.valueRootBuilders});

  @override
  List<Object> get props => [valueRootBuilders];

  _PrintBuilderState copyWith({
    List<ValueContainerBuilder>? valueRootBuilders,
  }) {
    return _PrintBuilderState(
      valueRootBuilders: valueRootBuilders ?? this.valueRootBuilders,
    );
  }
}