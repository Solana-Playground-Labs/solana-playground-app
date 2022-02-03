part of 'declare_variable_builder_cubit.dart';

class DeclareVariableBuilderState extends Equatable {
  final DeclareVariableStatement statement;

  const DeclareVariableBuilderState({required this.statement});

  @override
  List<Object> get props => [statement];
}