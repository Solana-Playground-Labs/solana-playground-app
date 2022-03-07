import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'create_transaction_command_builder_cubit.dart';

class CreateTransactionCommandBuilderWidget extends CubitWidget<
    CreateTransactionCommandBuilderCubit,
    CreateTransactionCommandBuilderState> {
  final CreateTransactionCommandBuilder builder;

  CreateTransactionCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
      BuildContext context, CreateTransactionCommandBuilderState state) {
    return Column(
      children: const [
        Text("Create transaction"),
        IntrinsicWidth(child: VariableInputWidget()),
      ],
    );
  }

  @override
  CreateTransactionCommandBuilderCubit cubit(BuildContext context) =>
      CreateTransactionCommandBuilderCubit(builder);
}
