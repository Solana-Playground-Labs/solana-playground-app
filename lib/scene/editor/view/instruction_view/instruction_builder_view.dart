import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'instruction_builder_view_cubit.dart';
import 'widget/instruction_templates_widget.dart';

class InstructionBuilderView extends CubitWidget<InstructionBuilderViewCubit,
    InstructionBuilderViewState> {
  final JsonValueBuilder builder;

  InstructionBuilderView({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, InstructionBuilderViewState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instruction builder"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: Row(
        children: [
          const InstructionTemplatesWidget(),
        ],
      ),
    );
  }

  @override
  InstructionBuilderViewCubit cubit(BuildContext context) =>
      InstructionBuilderViewCubit(builder);
}
