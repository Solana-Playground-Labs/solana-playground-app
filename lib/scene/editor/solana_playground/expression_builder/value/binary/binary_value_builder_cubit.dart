import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'binary_value_builder_state.dart';

class BinaryValueBuilderCubit extends Cubit<BinaryValueBuilderState> {
  final BinaryValueBuilder builder;

  BinaryValueBuilderCubit(this.builder)
      : super(BinaryValueBuilderState(builders: List.of(builder.data))) {
    builder.data.addListener(listener);
  }

  void listener() {
    if (!isClosed) emit(state.copyWith(builders: List.of(builder.data)));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
