part of 'block_builder_cubit.dart';

class StatementsBuilderState extends Equatable {
  final List<StatementBuilder> statements;

  const StatementsBuilderState({this.statements = const []});

  StatementBuilder? before(StatementBuilder builder) {
    final index = statements.indexOf(builder);
    if (index - 1 < 0) return null;
    return statements[index - 1];
  }

  StatementBuilder? after(StatementBuilder builder) {
    final index = statements.indexOf(builder);
    if (index + 1 >= statements.length) return null;
    return statements[index + 1];
  }

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
