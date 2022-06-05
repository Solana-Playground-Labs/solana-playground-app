/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/command_builder/command_builder_widget.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'get_recent_block_hash_command_builder_cubit.dart';

class GetRecentBlockHashCommandBuilderWidget extends CubitWidget<
    GetRecentBlockHashCommandBuilderCubit,
    GetRecentBlockHashCommandBuilderState> {
  final CommandBuilderMetaInfo? metaInfo;
  final GetRecentBlockHashCommandBuilder builder;

  GetRecentBlockHashCommandBuilderWidget(
      {Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    GetRecentBlockHashCommandBuilderState state,
  ) {
    final theme = Theme.of(context);
    return ComponentHeader(
      icon: SvgPicture.asset(SPIcons.blockHash),
      name: commandHeaderFormatter("Fetch current block hash", metaInfo),
      trailing: CommandBuilderAction(builder: builder),
      content: Row(
        children: [
          const Text("Variable: "),
          IntrinsicWidth(
            child: TextFieldBuilderWidget<GetRecentBlockHashCommandBuilder>(
              hintText: "Name",
              style: SPLabelStyle.orange,
              adapter:
                  TextFieldBuilderAdapter<GetRecentBlockHashCommandBuilder>(
                builder: builder,
                getTextBuilder: (builder) => builder.variable,
                setTextBuilder: (builder, value) => builder.variable = value,
              ),
            ),
          ),
        ],
      ),
    );

    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Get recent block hash to  ",
            style: theme.textTheme.bodyText1,
          ),
          IntrinsicWidth(
            child: VariableInputWidget(
              controller: context
                  .read<GetRecentBlockHashCommandBuilderCubit>()
                  .variableInput,
            ),
          )
        ],
      ),
    );
  }

  @override
  GetRecentBlockHashCommandBuilderCubit cubit(BuildContext context) =>
      GetRecentBlockHashCommandBuilderCubit(builder);
}
