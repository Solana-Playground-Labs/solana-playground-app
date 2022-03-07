import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'transaction_instruction_meta_value_builder_cubit.dart';

class TransactionInstructionMetaValueBuilderWidget extends CubitWidget<
        TransactionInstructionMetaValueBuilderCubit,
        TransactionInstructionMetaValueBuilderState> {
  final JsonValueBuilder builder;

  TransactionInstructionMetaValueBuilderWidget(
      {Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context,
      TransactionInstructionMetaValueBuilderState state) {
    return const Text("Instruction");
  }

  @override
  TransactionInstructionMetaValueBuilderCubit cubit(BuildContext context) =>
      TransactionInstructionMetaValueBuilderCubit(builder);
}
