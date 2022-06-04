/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'double_value_builder_state.dart';

class DoubleValueBuilderCubit extends Cubit<DoubleValueBuilderState> {
  final DoubleValueBuilder builder;

  final input = TextEditingController();

  DoubleValueBuilderCubit(this.builder) : super(DoubleValueBuilderState()) {
    input.text = builder.value.toString();
    builder.addListener(listener);
  }

  void listener() {
    if (builder.value.toString() != input.text) {
      input.text = builder.value.toString();
    }
  }

  void didUpdated() {
    final value = double.tryParse(input.text);
    if (value != null) {
      builder.value = value;
    } else {
      input.text = builder.value.toString();
    }
  }

  @override
  Future<void> close() async {
    input.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
