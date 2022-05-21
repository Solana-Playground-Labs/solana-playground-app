/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../list/list_value_builder_widget.dart';
import 'binary_value_builder_cubit.dart';

class BinaryValueBuilderWidget
    extends CubitWidget<BinaryValueBuilderCubit, BinaryValueBuilderState> {
  final BinaryValueBuilder builder;

  BinaryValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BinaryValueBuilderState state) {
    return SPCard(
      level: 2,
      child: ListValueBuilderWidget(
        onCreate: () =>
            ExpressionBuilder(valueBuilder: ByteValueBuilder.empty()),
        builder: builder.data,
      ),
    );
  }

  @override
  BinaryValueBuilderCubit cubit(BuildContext context) =>
      BinaryValueBuilderCubit(builder);
}
