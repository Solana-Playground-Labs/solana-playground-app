import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'code_editor_state.dart';

class CodeEditorCubit extends Cubit<CodeEditorState> {
  final SPPackageBuilder packageBuilder = SPPackageBuilder(
    packageType: SPPackageType.application,
    functionBuilders: [
      SPFunctionBuilder(name: "main", blockBuilder: BlockBuilder(statementBuilders: []), returnType: const InternalVoid())
    ],
  );

  CodeEditorCubit() : super(const CodeEditorState()) {
    emit(state.copyWith(currentFunction: packageBuilder.functionBuilders.first));
  }

  void unfocus() {
    emit(state.unfocus());
  }

  void focus(BaseBuilder builder) {
    print("Focus to ${builder.runtimeType.toString()} with ${builder.id}");
    emit(state.copyWith(focusedBuilder: builder));
  }
}
