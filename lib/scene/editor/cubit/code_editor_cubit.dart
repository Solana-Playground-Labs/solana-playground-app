import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'code_editor_state.dart';

class CodeEditorCubit extends Cubit<CodeEditorState> {
  CodeEditorCubit() : super(const CodeEditorState());

  void unfocus() {
    emit(state.unfocus());
  }

  void focus(StatementBuilder statementBuilder) {
    print(statementBuilder.id);
    emit(state.copyWith(focusedBuilder: statementBuilder));
  }
}
