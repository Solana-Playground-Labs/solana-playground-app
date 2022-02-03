import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'declare_variables_builder_state.dart';

class DeclareVariablesBuilderCubit extends Cubit<DeclareVariablesBuilderState> {
  final DeclareVariablesBuilder builder;

  DeclareVariablesBuilderCubit(this.builder)
      : super(DeclareVariablesBuilderState(
          statement: builder.statement,
          children: builder.children,
        )) {
    builder.addListener(listener);
  }

  listener() {
    emit(state.copyWith(statement: builder.statement, children: builder.children));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    super.close();
  }
}
