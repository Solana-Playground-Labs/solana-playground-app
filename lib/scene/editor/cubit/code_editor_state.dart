part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final BaseBuilder? focusedBuilder;

  const CodeEditorState({this.focusedBuilder});

  @override
  List<Object?> get props => [focusedBuilder];

  CodeEditorState unfocus() => copyWith();

  CodeEditorState copyWith({
    BaseBuilder? focusedBuilder,
  }) {
    return CodeEditorState(
      focusedBuilder: focusedBuilder ?? this.focusedBuilder,
    );
  }
}
