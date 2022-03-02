part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final BaseBuilder? focusedBuilder;
  final ScriptBuilder? currentFunction;

  const CodeEditorState({this.focusedBuilder, this.currentFunction});

  @override
  List<Object?> get props => [focusedBuilder, currentFunction];

  CodeEditorState unfocus() => copyWith();

  CodeEditorState copyWith({
    BaseBuilder? focusedBuilder,
    ScriptBuilder? currentFunction,
  }) {
    return CodeEditorState(
      focusedBuilder: focusedBuilder ?? this.focusedBuilder,
      currentFunction: currentFunction ?? this.currentFunction,
    );
  }
}
