import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../statement_builder/statement_feedback.dart';

class StatementTemplatesWidget extends StatelessWidget {
  const StatementTemplatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // TemplateWidget(
        //   title: "Declare variable",
        //   onTap: () {
        //     context.read<StatementsBuilderCubit>().add(DeclareVariableBuilder.standard());
        //   },
        // ),
        TemplateWidget(
          title: "Declare variables",
          statementBuilder: DeclareVariablesBuilder.standard(),
        ),
        TemplateWidget(
          title: "Print",
          statementBuilder: PrintBuilder.standard(),
        )
      ],
    );
  }
}

class TemplateWidget<T extends StatementBuilder> extends StatelessWidget {
  final String title;
  final T statementBuilder;

  const TemplateWidget({Key? key, required this.title, required this.statementBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<T>(
      data: statementBuilder,
      feedback: StatementFeedback(builder: statementBuilder),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PGCard(
          child: InkWell(
            onTap: () {
              context.read<CodeEditorCubit>().state.currentFunction?.blockBuilder.add(statementBuilder.copy());
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: Text(title)),
            ),
          ),
        ),
      ),
    );
  }
}
