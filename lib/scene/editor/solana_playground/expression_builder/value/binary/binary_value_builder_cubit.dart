import 'dart:typed_data';

import 'package:base_x/base_x.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/hex.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'hex_editor_controller.dart';

part 'binary_value_builder_state.dart';

class BinaryValueBuilderCubit extends Cubit<BinaryValueBuilderState> {
  final BinaryValueBuilder builder;
  final TextEditingController inputController = TextEditingController();

  final base16 = BaseXCodec("0123456789abcdef");

  BinaryValueBuilderCubit(this.builder)
      : super(BinaryValueBuilderState(data: builder.data)) {
    builder.addListener(listener);

    inputController.text = Hex.fromList(builder.data);
    inputController.addListener(() {
      builder.data = Uint8List.fromList(Hex.fromString(inputController.text));
      emit(
          state.copyWith(cursorPosition: inputController.selection.baseOffset));
    });
  }

  void listener() {
    final data = Hex.fromList(builder.data);
    if (data != inputController.text) {
      inputController.text = data;
    }

    emit(state.copyWith(data: builder.data));
  }

  @override
  Future<void> close() async {
    inputController.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
