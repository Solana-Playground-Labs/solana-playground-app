/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/console_io_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ConsoleIOWidget extends CubitWidget<ConsoleIOCubit, ConsoleIOState> {
  const ConsoleIOWidget({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, ConsoleIOState state) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final event = state.histories[index];
        return SelectableText(
          "${event.timestamp}: ${event.data.replaceAll("\\n", "\n")}",
          style: const TextStyle(color: Colors.white),
        );
      },
      itemCount: state.histories.length,
    );
  }

  @override
  ConsoleIOCubit cubit(BuildContext context) =>
      ConsoleIOCubit(context.read<RuntimeCubit>().console.stream);
}
