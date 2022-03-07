part of 'list_meta_value_builder_cubit.dart';

class ListMetaValueBuilderState extends Equatable {
  final List<dynamic> builders;

  const ListMetaValueBuilderState({this.builders = const []});

  @override
  List<Object> get props => [builders];

  ListMetaValueBuilderState copyWith({
    List<dynamic>? builders,
  }) {
    return ListMetaValueBuilderState(
      builders: builders ?? this.builders,
    );
  }
}