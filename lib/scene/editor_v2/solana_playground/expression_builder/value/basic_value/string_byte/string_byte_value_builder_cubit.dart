/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'string_byte_value_builder_state.dart';

class StringByteValueBuilderCubit extends Cubit<StringByteValueBuilderState> {
  final StringByteValueBuilder builder;
  final baseInput = TextEditingController();

  StringByteValueBuilderCubit(this.builder) : super(const StringByteValueBuilderState()) {
    builder.addListener(listener);

    baseInput.text = builder.base.toString();
    baseInput.addListener(() {
      final value = int.tryParse(baseInput.text);
      if (value != null) builder.base = value;
    });
  }

  void listener() {
    if (builder.base.toString() != baseInput.text) {
      baseInput.text = builder.base.toString();
    }
  }

  @override
  Future<void> close() async {
    baseInput.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
