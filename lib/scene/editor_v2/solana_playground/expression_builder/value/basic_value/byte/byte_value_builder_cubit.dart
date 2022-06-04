/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'byte_value_builder_state.dart';

class ByteValueBuilderCubit extends Cubit<ByteValueBuilderState> {
  final ByteValueBuilder builder;
  final lengthInput = TextEditingController();

  ByteValueBuilderCubit(this.builder) : super(const ByteValueBuilderState()) {
    builder.addListener(listener);

    lengthInput.text = builder.length.toString();
    lengthInput.addListener(() {
      final value = int.tryParse(lengthInput.text);
      if (value != null) builder.length = value;
    });
  }

  void listener() {
    if (builder.length.toString() != lengthInput.text) {
      lengthInput.text = builder.length.toString();
    }
  }

  @override
  Future<void> close() async {
    lengthInput.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
