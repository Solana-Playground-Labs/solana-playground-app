/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'expression_builder_state.dart';

class ExpressionBuilderCubit extends Cubit<ExpressionBuilderState> {
  final ExpressionBuilder builder;
  final FocusScopeNode focusNode = FocusScopeNode();

  ExpressionBuilderCubit(this.builder)
      : super(ExpressionBuilderState(valueBuilder: builder.valueBuilder)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(valueBuilder: builder.valueBuilder));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    focusNode.dispose();
    return super.close();
  }
}
