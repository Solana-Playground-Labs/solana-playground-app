import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'statements_builder_state.dart';

class StatementsBuilderCubit extends Cubit<StatementsBuilderState> {
  final builder = ProgramBuilderImpl();

  StatementsBuilderCubit(ProgramBuilder programBuilder)
      : super(StatementsBuilderState(statements: programBuilder.statements)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(statements: builder.statements));
  }

  add(StatementBuilder statementBuilder) {
    builder.add(statementBuilder);
  }

  remove(StatementBuilder statementBuilder) {
    builder.remove(statementBuilder);
  }

  moveUp(StatementBuilder statementBuilder) {
    final index = builder.statements.indexOf(statementBuilder);
    if (index == -1) return;
    builder.moveTo(statementBuilder, min(index + 1, builder.statements.length));
  }

  moveDown(StatementBuilder statementBuilder) {
    final index = builder.statements.indexOf(statementBuilder);
    if (index == -1) return;
    builder.moveTo(statementBuilder, max(index - 1, 0));
  }
}
