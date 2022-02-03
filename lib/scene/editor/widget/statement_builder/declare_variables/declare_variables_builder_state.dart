part of 'declare_variables_builder_cubit.dart';

class DeclareVariablesBuilderState extends Equatable {
  final DeclareVariablesStatement statement;
  final List<DeclareVariableBuilder> children;

  const DeclareVariablesBuilderState({required this.statement, this.children = const []});

  @override
  List<Object> get props => [statement, children];

  DeclareVariablesBuilderState copyWith({
    DeclareVariablesStatement? statement,
    List<DeclareVariableBuilder>? children,
  }) {
    return DeclareVariablesBuilderState(
      statement: statement ?? this.statement,
      children: children ?? this.children,
    );
  }
}
