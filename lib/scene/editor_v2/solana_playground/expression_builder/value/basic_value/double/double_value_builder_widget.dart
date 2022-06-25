/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'double_value_builder_cubit.dart';

class DoubleValueBuilderWidget
    extends CubitWidget<DoubleValueBuilderCubit, DoubleValueBuilderState> {
  final DoubleValueBuilder builder;

  DoubleValueBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, DoubleValueBuilderState state) {
    return IntrinsicWidth(
      child: SPLabel(
        style: SPLabelStyle.keppel,
        child: FocusScope(
          onFocusChange: (value) {
            if (!value) {
              context.read<DoubleValueBuilderCubit>().didUpdated();
            }
          },
          child: TextField(
            controller: context.read<DoubleValueBuilderCubit>().input,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
            ],
            textAlign: TextAlign.center,
            maxLines: 1,
            decoration: SPTextField.compactInputDecoration
                .copyWith(hintText: "Length", suffixText: "Byte(s)"),
          ),
        ),
      ),
    );
  }

  @override
  DoubleValueBuilderCubit cubit(BuildContext context) => DoubleValueBuilderCubit(builder);
}
