part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final Builder? focusedBuilder;
  final ScriptBuilder? currentScript;

  const CodeEditorState({this.focusedBuilder, this.currentScript});

  @override
  List<Object?> get props => [focusedBuilder, currentScript];

  CodeEditorState unfocus() => copyWith();

  CodeEditorState copyWith({
    Builder? focusedBuilder,
    ScriptBuilder? currentScript,
  }) {
    return CodeEditorState(
      focusedBuilder: focusedBuilder ?? this.focusedBuilder,
      currentScript: currentScript ?? this.currentScript,
    );
  }
}
