/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'string_byte_value_builder_cubit.dart';

class StringByteValueBuilderWidget extends CubitWidget<
    StringByteValueBuilderCubit, StringByteValueBuilderState> {
  final StringByteValueBuilder builder;

  StringByteValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, StringByteValueBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      level: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("String:  ", style: theme.textTheme.bodyText1),
          const SizedBox(height: 8),
          Flexible(child: ExpressionBuilderWidget(builder: builder.expression)),
          const SizedBox(height: 8),
          Text("with base:  ", style: theme.textTheme.bodyText1),
          const SizedBox(height: 8),
          Flexible(
            child: IntrinsicWidth(
              child: SPLabel(
                style: SPLabelStyle.purple,
                child: TextField(
                  controller:
                      context.read<StringByteValueBuilderCubit>().baseInput,
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
  StringByteValueBuilderCubit cubit(BuildContext context) =>
      StringByteValueBuilderCubit(builder);
}
