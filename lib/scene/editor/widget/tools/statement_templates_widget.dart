import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/cubit/statements_builder_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          onTap: () {
            context.read<StatementsBuilderCubit>().add(DeclareVariablesBuilder.standard());
          },
        )
      ],
    );
  }
}

class TemplateWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TemplateWidget({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PGCard(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Text(title)),
          ),
        ),
      ),
    );
  }
}
