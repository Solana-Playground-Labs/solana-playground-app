/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:solana_playground_app/model/package_edit_controller.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../model/focus_builder.dart';

part 'code_editor_state.dart';

class CodeEditorCubit extends Cubit<CodeEditorState> {
  final PackageEditController packageEditController;
  final ScrollController scrollController = ScrollController();

  CodeEditorCubit(this.packageEditController) : super(const CodeEditorState()) {
    emit(
      state.copyWith(
        currentScript: packageEditController.currentBuilder.scriptBuilders.first,
      ),
    );
  }

  void unfocus() {
    emit(state.unfocus());
  }

  void focus(FocusBuilder focus) {
    if (kDebugMode) {
      print(
        "Focus to ${focus.builder.runtimeType.toString()} with ${focus.builder.id}",
      );
    }

    emit(state.copyWith(focusBuilder: focus));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
