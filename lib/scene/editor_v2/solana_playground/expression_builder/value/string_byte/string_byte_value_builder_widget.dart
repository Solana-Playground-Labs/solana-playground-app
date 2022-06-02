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
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../../editor_v2.dart';
import 'string_byte_value_builder_cubit.dart';

class StringByteValueBuilderWidget extends CubitWidget<
    StringByteValueBuilderCubit, StringByteValueBuilderState> {
  final StringByteValueBuilder builder;

  StringByteValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, StringByteValueBuilderState state) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: IntrinsicWidth(
            child: SPLabel(
              style: SPLabelStyle.keppel,
              child: TextField(
                controller:
                    context.read<StringByteValueBuilderCubit>().baseInput,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.black),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\d')),
                ],
                textAlign: TextAlign.center,
                maxLines: 1,
                decoration: SPTextField.compactInputDecoration
                    .copyWith(hintText: "Length", suffixText: "Base"),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Flexible(child: ExpressionBuilderWidget(builder: builder.expression)),
      ],
    );
  }

  @override
  StringByteValueBuilderCubit cubit(BuildContext context) =>
      StringByteValueBuilderCubit(builder);
}
