/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../editor_v2.dart';

class DeclareVariableCommandBuilderWidget extends CubitWidget<
    DeclareVariableCommandBuilderCubit, DeclareVariableCommandBuilderState> {
  final DeclareVariableCommandBuilder builder;

  DeclareVariableCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    DeclareVariableCommandBuilderState state,
  ) {
    return ComponentHeader(
      icon: SvgPicture.asset(SPIcons.variable),
      trailing: CommandBuilderAction(builder: builder),
      name: "Declare variable",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text("Name: "),
              Flexible(
                child: IntrinsicWidth(
                  child: VariableInputWidget(
                    controller: context
                        .read<DeclareVariableCommandBuilderCubit>()
                        .variableInputController,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Value: "),
              ExpressionBuilderWidget(builder: builder.expressionBuilder),
            ],
          )
        ],
      ),
    );
  }

  @override
  DeclareVariableCommandBuilderCubit cubit(BuildContext context) =>
      DeclareVariableCommandBuilderCubit(builder);
}
