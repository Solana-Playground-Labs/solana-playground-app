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
    return SPCard(
      level: 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Value:  ", style: theme.textTheme.bodyText1),
          Flexible(
              child: ExpressionBuilderWidget(builder: builder.expression)),
          Text("  with byte length:  ", style: theme.textTheme.bodyText1),
          Flexible(
            child: IntrinsicWidth(
              child: SPLabel(
                style: SPLabelStyle.purple,
                child: TextField(
                  controller:
                      context.read<ByteValueBuilderCubit>().lengthInput,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  textAlign: TextAlign.center,
                  decoration: SPTextField.compactInputDecoration.copyWith(
                    hintText: "Length",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  ByteValueBuilderCubit cubit(BuildContext context) =>
      ByteValueBuilderCubit(builder);
}
