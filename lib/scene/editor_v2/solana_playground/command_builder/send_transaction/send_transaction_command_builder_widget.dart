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
import 'send_transaction_command_builder_cubit.dart';

class SendTransactionCommandBuilderWidget extends StatelessWidget {
  final CommandBuilderMetaInfo? metaInfo;
  final SendTransactionCommandBuilder builder;

  SendTransactionCommandBuilderWidget({
    Key? key,
    required this.builder,
    this.metaInfo,
  }) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ComponentHeader(
      icon: SvgPicture.asset(SPIcons.submit),
      name: commandHeaderFormatter("Submit transaction", metaInfo),
      trailing: CommandBuilderAction(builder: builder),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("Transaction signature: ", style: theme.textTheme.bodyText1),
              TextFieldBuilderWidget<SendTransactionCommandBuilder>(
                adapter: TextFieldBuilderAdapter<SendTransactionCommandBuilder>(
                  builder: builder,
                  getTextBuilder: (builder) => builder.variable,
                  setTextBuilder: (builder, value) => builder.variable = value,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Transaction: ", style: theme.textTheme.bodyText1),
              IntrinsicWidth(
                child: ExpressionBuilderWidget(
                  builder: builder.transaction,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // return SPCard(
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text("Send transaction  ", style: theme.textTheme.bodyText1),
    //       Flexible(
    //         flex: 1,
    //         child: ExpressionBuilderWidget(builder: builder.expressionBuilder),
    //       ),
    //       Text("  with id  ", style: theme.textTheme.bodyText1),
    //       Flexible(
    //         child: IntrinsicWidth(
    //           child: VariableInputWidget(
    //             controller: context
    //                 .read<SendTransactionCommandBuilderCubit>()
    //                 .variableInput,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
