/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/drag_cubit.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../command_builder/command_feedback.dart';

final List<Widget> _basisTemplates = [
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.variable),
    title: "Declare variables",
    commandBuilder: DeclareVariableCommandBuilder.empty(),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.comment),
    title: "Comment",
    commandBuilder: CommentCommandBuilder(content: ""),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.info),
    title: "Log",
    commandBuilder: PrintCommandBuilder(
      expression: ExpressionBuilder.withList(),
    ),
  ),
];

final List<Widget> _keyManagerTemplates = [
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.keypair),
    title: "Make keypair",
    commandBuilder: MakeKeyPairCommandBuilder(
      variable: "",
      publicKey: ExpressionBuilder.withStringValue(),
      privateKey: ExpressionBuilder.withStringValue(),
    ),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.keypair),
    title: "Import keypair from storage",
    commandBuilder: ImportKeypairFromStorageCommandBuilder(
      variable: "",
      walletName: ExpressionBuilder.withStringValue(),
    ),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.pda),
    title: "Create associated spl account",
    commandBuilder: CreateSplAssociatedTokenAccountCommandBuilder(
      variable: "",
      baseAddress: ExpressionBuilder.withStringValue(),
      mintAddress: ExpressionBuilder.withStringValue(),
    ),
  ),
];

final List<Widget> _blockchainTemplates = [
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.blockHash),
    title: "Get recent block hash",
    commandBuilder: GetRecentBlockHashCommandBuilder.empty(),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.submitTransaction),
    title: "Make transaction",
    commandBuilder: MakeSimpleTransactionBuilder(
      variable: "",
      feePayer: ExpressionBuilder.withStringValue(),
      recentBlockHash: ExpressionBuilder.withVariable(),
      signers: ExpressionBuilder.withList(),
      instructions: ExpressionBuilder.withList(),
    ),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.sign),
    title: "Sign transaction",
    commandBuilder: SignCommandBuilder(
      variable: "",
      signers: ExpressionBuilder.withList(),
      transaction: ExpressionBuilder.withVariable(),
    ),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.submit),
    title: "Send transaction",
    commandBuilder: SendTransactionCommandBuilder(
      variable: "",
      transaction: ExpressionBuilder.withVariable(),
    ),
  ),
  TemplateWidget(
    icon: SvgPicture.asset(SPIconAssets.waiting),
    title: "Wait transaction confirmation",
    commandBuilder: WaitTransactionConfirmationCommandBuilder(
      transaction: ExpressionBuilder.withVariable(),
    ),
  ),
];

class CommandTemplatesWidget extends StatelessWidget {
  const CommandTemplatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        TemplateGroup(
          title: "Basis",
          description: "Basis commands",
          templates: _basisTemplates,
        ),
        TemplateGroup(
          title: "Key manager",
          description: "The section for working with keys",
          templates: _keyManagerTemplates,
        ),
        TemplateGroup(
          title: "Transaction",
          description:
              "The section for creating transaction and submiting them.",
          templates: _blockchainTemplates,
        )
      ],
    );
  }
}

class TemplateGroup extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> templates;

  const TemplateGroup({
    Key? key,
    required this.title,
    required this.description,
    required this.templates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: theme.textTheme.headline6),
              Text(description, style: theme.textTheme.caption),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => templates[index],
          childCount: templates.length,
        ),
      ),
      const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8)),
    ]);
  }
}

class TemplateWidget<T extends CommandBuilder> extends StatelessWidget {
  final Widget? icon;
  final String title;
  final T commandBuilder;

  const TemplateWidget({
    Key? key,
    required this.title,
    this.icon,
    required this.commandBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<T>(
      affinity: Axis.horizontal,
      data: commandBuilder,
      feedback: CommandFeedback(
        icon: icon,
        title: title,
        builder: commandBuilder,
      ),
      onDragStarted: () {
        context.read<DragCubit>().active();
      },
      onDragEnd: (_) {
        context.read<DragCubit>().deactive();
      },
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context
                  .read<CodeEditorCubit>()
                  .state
                  .currentScript
                  ?.blockCommandBuilder
                  .commands
                  .add(commandBuilder.clone());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(title),
                ],
              ),
            ),
          ),
          const Divider(height: 1, indent: 16),
        ],
      ),
    );
  }
}
