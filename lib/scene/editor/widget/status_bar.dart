/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';

import '../cubit/runtime_cubit.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RuntimeCubit, RuntimeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.read<RuntimeCubit>().run();
                },
                icon: const Icon(Icons.play_arrow)),
            SizedBox(
              width: 400,
              child: SPCard(
                level: 1,
                child: Row(
                  children: [
                    BlocBuilder<CodeEditorCubit, CodeEditorState>(
                        builder: (context, state) => Text(
                            state.currentScript?.name ??
                                "Unknown project name")),
                    const Spacer(),
                    indicator(context, state),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget indicator(BuildContext context, RuntimeState state) {
    switch (state.status) {
      case RuntimeStatus.idle:
        return const Text("Ready to run");
      case RuntimeStatus.compiling:
        return const Text("Compiling");
      case RuntimeStatus.running:
        return const Text("Running");
    }
  }
}
