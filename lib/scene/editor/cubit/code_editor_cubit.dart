import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../model/focus_builder.dart';

part 'code_editor_state.dart';

class CodeEditorCubit extends Cubit<CodeEditorState> {
  final SPPackageBuilder packageBuilder = SPPackageBuilder(
    packageType: PackageType.application,
    functionBuilders: [
      ScriptBuilder(
          name: "main",
          blockCommandBuilder: BlockCommandBuilder(
            commands: ListBuilder.empty(),
          ))
    ],
  );

  CodeEditorCubit() : super(const CodeEditorState()) {
    emit(state.copyWith(currentScript: packageBuilder.functionBuilders.first));
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
}
