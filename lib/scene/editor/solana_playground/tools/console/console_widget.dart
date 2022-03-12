import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'console_cubit.dart';

class ConsoleWidget extends CubitWidget<ConsoleCubit, ConsoleState> {
  const ConsoleWidget({Key? key}) : super();

  @override
  Widget content(BuildContext context, ConsoleState state) {
    return ListView.builder(
      itemCount: state.lines.length,
      itemBuilder: (context, index) {
        return Text(state.lines[index]);
      },
    );
  }

  @override
  ConsoleCubit cubit(BuildContext context) => ConsoleCubit(context.read());
}
