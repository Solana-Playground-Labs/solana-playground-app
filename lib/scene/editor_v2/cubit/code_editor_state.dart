/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final FocusBuilder? focusBuilder;
  final ScriptBuilder? currentScript;

  const CodeEditorState({this.focusBuilder, this.currentScript});

  @override
  List<Object?> get props => [
        focusBuilder,
        currentScript,
      ];

  CodeEditorState unfocus() => CodeEditorState(
        currentScript: currentScript,
      );

  CodeEditorState copyWith({
    FocusBuilder? focusBuilder,
    ScriptBuilder? currentScript,
    bool? isLeftPanelHidden,
    bool? isRightPanelHidden,
    bool? isBottomPanelHidden,
  }) {
    return CodeEditorState(
      focusBuilder: focusBuilder ?? this.focusBuilder,
      currentScript: currentScript ?? this.currentScript,
    );
  }
}
