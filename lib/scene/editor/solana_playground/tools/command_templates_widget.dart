import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/command_feedback.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommandTemplatesWidget extends StatelessWidget {
  const CommandTemplatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TemplateWidget(
          title: "Declare variables",
          commandBuilder: DeclareVariableCommandBuilder.empty(),
        ),
        TemplateWidget(
          title: "Print",
          commandBuilder: PrintCommandBuilder.empty(),
        ),
        TemplateWidget(
          title: "Create transaction",
          commandBuilder: CreateTransactionCommandBuilder.empty(),
        ),
        TemplateWidget(
          title: "Send transaction",
          commandBuilder: SendTransactionCommandBuilder.empty(),
        ),
        TemplateWidget(
          title: "Wait transaction confirmation",
          commandBuilder: WaitConfirmationCommandBuilder.empty(),
        ),
      ],
    );
  }
}

class TemplateWidget<T extends CommandBuilder> extends StatelessWidget {
  final String title;
  final T commandBuilder;

  const TemplateWidget(
      {Key? key, required this.title, required this.commandBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<T>(
      data: commandBuilder,
      feedback: CommandFeedback(builder: commandBuilder),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SPCard(
          child: InkWell(
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
              padding: const EdgeInsets.all(6.0),
              child: Text(title),
            ),
          ),
        ),
      ),
    );
  }
}
