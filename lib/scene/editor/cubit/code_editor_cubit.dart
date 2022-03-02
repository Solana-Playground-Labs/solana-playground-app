import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

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

  void focus(Builder builder) {
    print("Focus to ${builder.runtimeType.toString()} with ${builder.id}");
    emit(state.copyWith(focusedBuilder: builder));
  }
}
