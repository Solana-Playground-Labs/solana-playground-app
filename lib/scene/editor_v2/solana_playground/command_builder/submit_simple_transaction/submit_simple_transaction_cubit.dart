/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'submit_simple_transaction_state.dart';

class SubmitSimpleTransactionCubit extends Cubit<SubmitSimpleTransactionState> {
  final SubmitSimpleTransactionBuilder builder;

  SubmitSimpleTransactionCubit(this.builder)
      : super(SubmitSimpleTransactionState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

