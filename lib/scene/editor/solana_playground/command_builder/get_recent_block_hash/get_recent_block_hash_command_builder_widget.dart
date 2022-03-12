import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'get_recent_block_hash_command_builder_cubit.dart';

class GetRecentBlockHashCommandBuilderWidget extends CubitWidget<
    GetRecentBlockHashCommandBuilderCubit,
    GetRecentBlockHashCommandBuilderState> {
  final GetRecentBlockHashCommandBuilder builder;

  GetRecentBlockHashCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    GetRecentBlockHashCommandBuilderState state,
  ) {
    final theme = Theme.of(context);
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
