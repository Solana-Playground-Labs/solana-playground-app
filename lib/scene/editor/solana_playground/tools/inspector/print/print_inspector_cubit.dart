import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'print_inspector_state.dart';

class PrintInspectorCubit extends Cubit<PrintInspectorState> {
  final PrintBuilder builder;

  PrintInspectorCubit(this.builder) : super(PrintInspectorState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
