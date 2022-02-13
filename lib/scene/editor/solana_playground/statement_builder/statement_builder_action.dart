import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/statement_builder/block_builder_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class StatementBuilderAction extends StatelessWidget {
  final StatementBuilder builder;

  StatementBuilderAction({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => context.read<BlockBuilderCubit>().remove(builder),
          child: const Text("Delete"),
        ),
        TextButton(
          onPressed: () => context.read<BlockBuilderCubit>().moveUp(builder),
          child: const Text("Up"),
        ),
        TextButton(
          onPressed: () => context.read<BlockBuilderCubit>().moveDown(builder),
          child: const Text("Down"),
        ),
      ],
    );
  }
}
