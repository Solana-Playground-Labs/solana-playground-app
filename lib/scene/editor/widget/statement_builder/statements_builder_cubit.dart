import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'statements_builder_state.dart';

class StatementsBuilderCubit extends Cubit<StatementsBuilderState> {
  final ProgramBuilder builder;

  StatementsBuilderCubit(this.builder) : super(StatementsBuilderState(statements: builder.statements)) {
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

  insertBefore(StatementBuilder oldBuilder, StatementBuilder newBuilder) {
    if (!builder.statements.contains(oldBuilder)) return;
    final index = builder.statements.indexOf(oldBuilder);

    if (builder.statements.contains(newBuilder)) {
      // Move
      builder.remove(newBuilder);
      builder.insert(index, newBuilder);
    } else {
      // Insert
      builder.insert(index, newBuilder);
    }
  }

  insertAfter(StatementBuilder oldBuilder, StatementBuilder newBuilder) {
    if (!builder.statements.contains(oldBuilder)) return;
    final index = builder.statements.indexOf(oldBuilder);

    if (builder.statements.contains(newBuilder)) {
      // Move
      builder.remove(newBuilder);
      builder.insert(index, newBuilder);
    } else {
      // Insert
      builder.insert(index + 1 , newBuilder);
    }
  }

  moveDown(StatementBuilder statementBuilder) {
    final index = builder.statements.indexOf(statementBuilder);
    if (index == -1) return;

    print(builder.statements.map((e) => e.id));
    builder.moveTo(statementBuilder, min(index + 1, builder.statements.length));
    print(builder.statements.map((e) => e.id));
  }

  moveUp(StatementBuilder statementBuilder) {
    final index = builder.statements.indexOf(statementBuilder);
    if (index == -1) return;

    print(builder.statements.map((e) => e.id));
    builder.moveTo(statementBuilder, max(index - 1, 0));
    print(builder.statements.map((e) => e.id));
  }
}
