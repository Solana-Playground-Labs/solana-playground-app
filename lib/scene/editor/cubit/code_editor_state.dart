part of 'code_editor_cubit.dart';

class CodeEditorState extends Equatable {
  final FocusBuilder? focusBuilder;
  final ScriptBuilder? currentScript;

  const CodeEditorState({this.focusBuilder, this.currentScript});

  @override
  List<Object?> get props => [focusBuilder, currentScript];

  CodeEditorState unfocus() => copyWith();

  CodeEditorState copyWith({
    FocusBuilder? focusBuilder,
    ScriptBuilder? currentScript,
  }) {
    return CodeEditorState(
      focusBuilder: focusBuilder ?? this.focusBuilder,
      currentScript: currentScript ?? this.currentScript,
    );
  }
}

class FocusBuilder extends Equatable {
  final Builder builder;

  const FocusBuilder({
    required this.builder,
  });

  @override
  List<Object?> get props => [
        builder,
      ];
}
