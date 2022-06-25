/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../editor_v2.dart';
import 'import_keypair_from_storage_command_builder_cubit.dart';

class ImportWalletCommandBuilderWidget
    extends CubitWidget<ImportWalletCommandBuilderCubit, ImportWalletCommandBuilderState> {
  final CommandBuilderMetaInfo? metaInfo;
  final ImportKeypairFromStorageCommandBuilder builder;

  ImportWalletCommandBuilderWidget({Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ImportWalletCommandBuilderState state) {
    final theme = Theme.of(context);
    return ComponentHeader(
      name: commandHeaderFormatter("Import keypair from storage", metaInfo),
      icon: SvgPicture.asset(SPIconAssets.keypair),
      trailing: CommandBuilderAction(builder: builder),
      content: Column(
        children: [
          Row(
            children: [
              Text("Variable: ", style: theme.textTheme.bodyText1),
              IntrinsicWidth(
                child: VariableInputWidget(
                  controller: context.read<ImportWalletCommandBuilderCubit>().variableInput,
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
  ImportWalletCommandBuilderCubit cubit(BuildContext context) =>
      ImportWalletCommandBuilderCubit(builder);
}
