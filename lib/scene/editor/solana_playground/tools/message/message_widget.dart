import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/cubit/cubit.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RuntimeCubit, RuntimeState>(
      buildWhen: (p, n) => p.compilingError != n.compilingError,
      builder: (context, state) {
        if (state.compilingError == null) {
          return const Center(
            child: Text("No message"),
          );
        }
        return Text(state.compilingError!);
      },
    );
  }
}