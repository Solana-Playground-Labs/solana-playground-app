import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'expression_inspector_state.dart';

class ExpressionInspectorCubit extends Cubit<ExpressionInspectorState> {
  final ExpressionBuilder builder;

  ExpressionInspectorCubit(this.builder)
      : super(ExpressionInspectorState(valueBuilder: builder.valueBuilder)) {
    builder.addListener(listener);
  }

  void listener() {
    print("inchange");
    emit(state.copyWith(valueBuilder: builder.valueBuilder));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
