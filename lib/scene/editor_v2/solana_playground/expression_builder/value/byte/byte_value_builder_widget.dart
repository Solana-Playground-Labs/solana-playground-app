/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import 'byte_value_builder_cubit.dart';

class ByteValueBuilderWidget
    extends CubitWidget<ByteValueBuilderCubit, ByteValueBuilderState> {
  final ByteValueBuilder builder;

  ByteValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ByteValueBuilderState state) {
    final theme = Theme.of(context);
    return Row(
      children: [
        IntrinsicWidth(
          child: SPLabel(
            style: SPLabelStyle.purple,
            child: TextField(
              controller: context.read<ByteValueBuilderCubit>().lengthInput,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.black),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: SPTextField.compactInputDecoration
                  .copyWith(hintText: "Length", suffixText: "Byte(s)"),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(child: ExpressionBuilderWidget(builder: builder.expression)),
      ],
    );
  }

  @override
  ByteValueBuilderCubit cubit(BuildContext context) =>
      ByteValueBuilderCubit(builder);
}
