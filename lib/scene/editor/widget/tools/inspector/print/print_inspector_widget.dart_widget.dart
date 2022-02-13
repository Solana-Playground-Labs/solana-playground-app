import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'print_inspector_widget.dart_cubit.dart';

part 'print_inspector_widget.dart_state.dart';

class PrintInspectorWidget extends CubitWidget<_PrintInspectorCubit, _PrintInspectorState> {
  final PrintBuilder builder;

  PrintInspectorWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, _PrintInspectorState state) {
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
  _PrintInspectorCubit cubit(BuildContext context) => _PrintInspectorCubit(builder);
}
