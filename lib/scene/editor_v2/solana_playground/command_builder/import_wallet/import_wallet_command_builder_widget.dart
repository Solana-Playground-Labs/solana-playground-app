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
    return ComponentHeader(
      name: "Import wallet",
      content: Column(
        children: [
          Row(
            children: [
              Text("Variable: ", style: theme.textTheme.bodyText1),
              IntrinsicWidth(
                child: VariableInputWidget(
                  controller: context
                      .read<ImportWalletCommandBuilderCubit>()
                      .variableInput,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Name: ", style: theme.textTheme.bodyText1),
              Flexible(
                child: ExpressionBuilderWidget(
                  builder: builder.walletName,
                  metaData: const ExpressionMetaDataNode(
                    allowTypes: TypeInspectorHelper.basicTypeList,
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
  ImportWalletCommandBuilderCubit cubit(BuildContext context) =>
      ImportWalletCommandBuilderCubit(builder);
}
