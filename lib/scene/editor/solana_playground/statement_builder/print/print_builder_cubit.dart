import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'print_builder_state.dart';

class PrintBuilderCubit extends Cubit<PrintBuilderState> {
  final PrintBuilder builder;

  PrintBuilderCubit(this.builder) : super(PrintBuilderState(valueRootBuilders: builder.valueRootBuilders)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(valueRootBuilders: builder.valueRootBuilders));
  }

  void remove(ValueContainerBuilder valueRootBuilder) {
    builder.remove(valueRootBuilder);
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
