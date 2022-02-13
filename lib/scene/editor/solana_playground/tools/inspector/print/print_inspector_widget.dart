import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'print_inspector_cubit.dart';

class PrintInspectorWidget extends CubitWidget<PrintInspectorCubit, PrintInspectorState> {
  final PrintBuilder builder;

  PrintInspectorWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, PrintInspectorState state) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            builder.add(ValueContainerBuilder.variable());
          },
          child: const Text("Add variable"),
        ),
      ],
    );
  }

  @override
  PrintInspectorCubit cubit(BuildContext context) => PrintInspectorCubit(builder);
}
