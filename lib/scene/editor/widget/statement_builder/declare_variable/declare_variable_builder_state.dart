part of 'declare_variable_builder_cubit.dart';

class DeclareVariableBuilderState extends Equatable {
  final InternalType internalType;

  const DeclareVariableBuilderState({required this.internalType});

  @override
  List<Object> get props => [internalType];

  DeclareVariableBuilderState copyWith({
    InternalType? internalType,
  }) {
    return DeclareVariableBuilderState(
      internalType: internalType ?? this.internalType,
    );
  }
}
