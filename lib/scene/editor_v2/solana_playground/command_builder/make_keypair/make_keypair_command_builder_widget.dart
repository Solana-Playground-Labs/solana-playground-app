/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/command_builder_action.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/common/component_header.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/expression_builder/expression_meta_data.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'make_keypair_command_builder_cubit.dart';

class MakeKeypairCommandBuilderWidget extends CubitWidget<
    MakeKeypairCommandBuilderCubit, MakeKeypairCommandBuilderState> {
  final CommandBuilderMetaInfo? metaInfo;
  final MakeKeyPairCommandBuilder builder;

  MakeKeypairCommandBuilderWidget({
    Key? key,
    this.metaInfo,
    required this.builder,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, MakeKeypairCommandBuilderState state) {
    final theme = Theme.of(context);
    return ComponentHeader(
      name: commandHeaderFormatter("Make key pair", metaInfo),
      icon: SvgPicture.asset(SPIcons.keypair),
      trailing: CommandBuilderAction(builder: builder),
      content: Column(
        children: [
          Row(
            children: [
              Text("Variable: ", style: theme.textTheme.bodyText1),
              IntrinsicWidth(
                child: VariableInputWidget(
                  controller: context
                      .read<MakeKeypairCommandBuilderCubit>()
                      .variableInput,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Public key: ", style: theme.textTheme.bodyText1),
              Flexible(
                child: ExpressionBuilderWidget(
                  builder: builder.publicKey,
                  metaData: const ExpressionMetaDataNode(
                    allowTypes: [StringValueBuilder],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Private key: ", style: theme.textTheme.bodyText1),
              Flexible(
                child: ExpressionBuilderWidget(
                  builder: builder.privateKey,
                  metaData: const ExpressionMetaDataNode(
                    allowTypes: [StringValueBuilder],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  MakeKeypairCommandBuilderCubit cubit(BuildContext context) =>
      MakeKeypairCommandBuilderCubit(builder);
}
