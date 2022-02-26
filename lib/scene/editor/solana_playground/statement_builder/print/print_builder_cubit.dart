import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'print_builder_state.dart';

class PrintBuilderCubit extends Cubit<PrintBuilderState> {
  final PrintBuilder builder;

  PrintBuilderCubit(this.builder) : super(PrintBuilderState(valueRootBuilders: builder.variables.builders)) {
    builder.addListener(listener);
    builder.variables.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(valueRootBuilders: builder.variables.builders));
  }

  void remove(ValueContainerBuilder valueRootBuilder) {
    builder.variables.remove(valueRootBuilder);
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    builder.variables.removeListener(listener);
    return super.close();
  }
}
