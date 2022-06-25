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
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

class ByteValueBuilderWidget extends CubitWidget<ByteValueBuilderCubit, ByteValueBuilderState> {
  final ByteValueBuilder builder;

  ByteValueBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ByteValueBuilderState state) {
    return Row(
      children: [
        IntrinsicWidth(
          child: SPLabel(
            style: SPLabelStyle.keppel,
            child: TextField(
              controller: context.read<ByteValueBuilderCubit>().lengthInput,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
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
  ByteValueBuilderCubit cubit(BuildContext context) => ByteValueBuilderCubit(builder);
}
