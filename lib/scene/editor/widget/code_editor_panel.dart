import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/statements_builder_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variable/declare_variable_builder_widget.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'statement_builder/declare_variables/declare_variables_builder_widget.dart';

class CodeEditorPanel extends StatelessWidget {
  const CodeEditorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EditorTheme.of(context).background3,
      child: BlocBuilder<StatementsBuilderCubit, StatementsBuilderState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final statement = state.statements[index];

                  Widget builderWidget = Container();
                  if (statement is DeclareVariableBuilder) {
                    builderWidget = DeclareVariableBuilderWidget(declareVariableBuilder: statement);
                  } else if (statement is DeclareVariablesBuilder) {
                    builderWidget = DeclareVariablesBuilderWidget(declareVariablesBuilder: statement);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 20),
                            child:
                                Text("$index", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.end),
                          ),
                        ),
                        builderWidget,
                      ],
                    ),
                  );
                }, childCount: state.statements.length),
              )
            ],
          );
        },
      ),
    );
  }
}
