import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'variable_value_builder_cubit.dart';

class VariableValueBuilderWidget
    extends CubitWidget<VariableValueBuilderCubit, VariableValueBuilderState> {
  final VariableValueBuilder builder;

  VariableValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, VariableValueBuilderState state) {
    return SPLabel(
      style: SPLabelStyle.orange,
      child: TextField(
        controller: context.read<VariableValueBuilderCubit>().inputController,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.black),
        decoration:
            SPTextField.compactInputDecoration.copyWith(hintText: "Variable"),
      ),
    );
  }

  @override
  VariableValueBuilderCubit cubit(BuildContext context) =>
      VariableValueBuilderCubit(builder);
}
