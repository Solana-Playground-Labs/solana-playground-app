import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'hex_value_builder_state.dart';

class HexValueBuilderCubit extends Cubit<HexValueBuilderState> {
  final HexValueBuilder builder;

  HexValueBuilderCubit(this.builder) : super(HexValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

