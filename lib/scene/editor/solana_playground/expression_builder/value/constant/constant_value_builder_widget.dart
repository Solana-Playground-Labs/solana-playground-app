/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'constant_value_builder_cubit.dart';

class ConstantValueBuilderWidget
    extends CubitWidget<ConstantValueBuilderCubit, ConstantValueBuilderState> {
  final ConstantValueBuilder builder;
  final FocusNode? focusNode;

  ConstantValueBuilderWidget({Key? key, required this.builder, this.focusNode})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ConstantValueBuilderState state) {
    return IntrinsicWidth(
      child: SPLabel(
        style: SPLabelStyle.green,
        child: TextField(
          controller: context.read<ConstantValueBuilderCubit>().inputController,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.black),
          decoration:
              SPTextField.compactInputDecoration.copyWith(hintText: "Constant"),
        ),
      ),
    );
  }

  @override
  ConstantValueBuilderCubit cubit(BuildContext context) =>
      ConstantValueBuilderCubit(builder);
}
