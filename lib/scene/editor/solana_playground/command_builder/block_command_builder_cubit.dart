import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'block_command_builder_state.dart';

class BlockCommandBuilderCubit extends Cubit<BlockCommandBuilderState> {
  final BlockCommandBuilder builder;

  BlockCommandBuilderCubit(this.builder)
      : super(BlockCommandBuilderState(commands: List.of(builder.commands))) {
    builder.commands.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(commands: List.of(builder.commands)));
  }


  @override
  Future close() async {
    super.close();
    builder.removeListener(listener);
  }

  add(CommandBuilder commandBuilder) {
    builder.commands.add(commandBuilder);
  }

  remove(CommandBuilder commandBuilder) {
    builder.commands.remove(commandBuilder);
  }

  insertBefore(CommandBuilder oldBuilder, CommandBuilder newBuilder) {
    if (!builder.commands.contains(oldBuilder)) return;
    final index = builder.commands.indexOf(oldBuilder);

    if (builder.commands.contains(newBuilder)) {
      // Move
      builder.commands.remove(newBuilder);
      builder.commands.insert(index, newBuilder);
    } else {
      // Insert
      builder.commands.insert(index, newBuilder);
    }
  }

  insertAfter(CommandBuilder oldBuilder, CommandBuilder newBuilder) {
    if (!builder.commands.contains(oldBuilder)) return;
    final index = builder.commands.indexOf(oldBuilder);

    if (builder.commands.contains(newBuilder)) {
      // Move
      builder.commands.remove(newBuilder);
      builder.commands.insert(index, newBuilder);
    } else {
      // Insert
      builder.commands.insert(index + 1, newBuilder);
    }
  }

  moveDown(CommandBuilder statementBuilder) {
    final index = builder.commands.indexOf(statementBuilder);
    if (index == -1) return;

    debugPrint(builder.commands.map((e) => e.id).toString());
    builder.commands
        .moveTo(statementBuilder, min(index + 1, builder.commands.length));
    debugPrint(builder.commands.map((e) => e.id).toString());
  }

  moveUp(CommandBuilder statementBuilder) {
    final index = builder.commands.indexOf(statementBuilder);
    if (index == -1) return;

    if (kDebugMode) print(builder.commands.map((e) => e.id));
    builder.commands.moveTo(statementBuilder, max(index - 1, 0));
    if (kDebugMode) print(builder.commands.map((e) => e.id));
  }
}
