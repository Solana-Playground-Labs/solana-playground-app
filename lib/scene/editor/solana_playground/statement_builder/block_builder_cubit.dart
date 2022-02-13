import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'block_builder_state.dart';

class BlockBuilderCubit extends Cubit<StatementsBuilderState> {
  final BlockBuilder builder;

  BlockBuilderCubit(this.builder) : super(StatementsBuilderState(statements: builder.statements)) {
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

    debugPrint(builder.statements.map((e) => e.id).toString());
    builder.moveTo(statementBuilder, min(index + 1, builder.statements.length));
    debugPrint(builder.statements.map((e) => e.id).toString());
  }

  moveUp(StatementBuilder statementBuilder) {
    final index = builder.statements.indexOf(statementBuilder);
    if (index == -1) return;

    print(builder.statements.map((e) => e.id));
    builder.moveTo(statementBuilder, max(index - 1, 0));
    print(builder.statements.map((e) => e.id));
  }
}
