part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final StatementBuilder? focusedBuilder;

  const CodeEditorState({this.focusedBuilder});

  @override
  List<Object?> get props => [focusedBuilder];

  CodeEditorState unfocus() => copyWith();

  CodeEditorState copyWith({
    StatementBuilder? focusedBuilder,
  }) {
    return CodeEditorState(
      focusedBuilder: focusedBuilder ?? this.focusedBuilder,
    );
  }
}
