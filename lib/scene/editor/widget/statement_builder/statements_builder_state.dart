part of 'statements_builder_cubit.dart';

class StatementsBuilderState extends Equatable {
  final List<StatementBuilder> statements;

  const StatementsBuilderState({this.statements = const []});

  @override
  List<Object?> get props => [statements];

  StatementsBuilderState copyWith({
    List<StatementBuilder>? statements,
  }) {
    return StatementsBuilderState(
      statements: statements ?? this.statements,
    );
  }
}
