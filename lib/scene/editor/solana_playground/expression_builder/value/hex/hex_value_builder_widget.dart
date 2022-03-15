/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'hex_value_builder_cubit.dart';

class HexValueBuilderWidget
    extends CubitWidget<HexValueBuilderCubit, HexValueBuilderState> {
  final HexValueBuilder builder;

  HexValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, HexValueBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      level: 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hex:  ", style: theme.textTheme.bodyText1),
          Flexible(child: ExpressionBuilderWidget(builder: builder.expression)),
        ],
      ),
    );
  }

  @override
  HexValueBuilderCubit cubit(BuildContext context) =>
      HexValueBuilderCubit(builder);
}
