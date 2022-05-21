/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/common.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../editor_v2.dart';
import 'import_wallet_command_builder_cubit.dart';

class ImportWalletCommandBuilderWidget extends CubitWidget<
    ImportWalletCommandBuilderCubit, ImportWalletCommandBuilderState> {
  final ImportWalletCommandBuilder builder;

  ImportWalletCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ImportWalletCommandBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Import wallet  ", style: theme.textTheme.bodyText1),
          Flexible(child: ExpressionBuilderWidget(builder: builder.walletName)),
          Text("  as  ", style: theme.textTheme.bodyText1),
          Flexible(
            flex: 1,
            child: IntrinsicWidth(
              child: VariableInputWidget(
                controller:
                    context.read<ImportWalletCommandBuilderCubit>().variableInput,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ImportWalletCommandBuilderCubit cubit(BuildContext context) =>
      ImportWalletCommandBuilderCubit(builder);
}
