/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'comment_command_builder_state.dart';

class CommentCommandBuilderCubit extends Cubit<CommentCommandBuilderState> {
  final CommentCommandBuilder builder;
  final commentInputController = TextEditingController();

  CommentCommandBuilderCubit(this.builder)
      : super(const CommentCommandBuilderState()) {
    builder.addListener(listener);

    commentInputController.text = builder.content;
    commentInputController.addListener(() {
      builder.content = commentInputController.text;
    });
  }

  void enterEditorMode() {
    emit(state.copyWith(editorMode: true));
  }

  void exitEditorMode() {
    emit(state.copyWith(editorMode: false));
  }

  void toggleEditorMode() {
    emit(state.copyWith(editorMode: !state.editorMode));
  }

  void listener() {
    if (commentInputController.text != commentInputController.text) {
      commentInputController.text = commentInputController.text;
    }
  }


  @override
  void onChange(Change<CommentCommandBuilderState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() async {
    commentInputController.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
