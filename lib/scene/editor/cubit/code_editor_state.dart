part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final FocusBuilder? focusBuilder;
  final ScriptBuilder? currentScript;

  final bool isLeftPanelHidden;
  final bool isRightPanelHidden;
  final bool isBottomPanelHidden;

  const CodeEditorState({
    this.focusBuilder,
    this.currentScript,
    this.isLeftPanelHidden = false,
    this.isRightPanelHidden = false,
    this.isBottomPanelHidden = true,
  });

  @override
  List<Object?> get props => [
        focusBuilder,
        currentScript,
        isLeftPanelHidden,
        isRightPanelHidden,
        isBottomPanelHidden,
      ];

  CodeEditorState unfocus() => CodeEditorState(
        currentScript: currentScript,
        isLeftPanelHidden: isLeftPanelHidden,
        isRightPanelHidden: isRightPanelHidden,
        isBottomPanelHidden: isBottomPanelHidden,
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
      isLeftPanelHidden: isLeftPanelHidden ?? this.isLeftPanelHidden,
      isRightPanelHidden: isRightPanelHidden ?? this.isRightPanelHidden,
      isBottomPanelHidden: isBottomPanelHidden ?? this.isBottomPanelHidden,
    );
  }
}
