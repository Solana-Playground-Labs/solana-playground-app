import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'statements_builder_state.dart';

class StatementsBuilderCubit extends Cubit<StatementsBuilderState> {
  final builder = ProgramBuilderImpl();

  StatementsBuilderCubit(ProgramBuilder programBuilder)
      : super(StatementsBuilderState(statements: programBuilder.statements)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(statements: builder.statements));
  }

  add(StatementBuilder statementBuilder) {
    builder.add(statementBuilder);
  }
}
