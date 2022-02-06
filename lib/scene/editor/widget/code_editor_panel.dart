import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/cubit/statements_builder_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/declare_variable/declare_variable_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/print/print_builder_widget.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'statement_builder/declare_variables/declare_variables_builder_widget.dart';

class CodeEditorPanel extends StatelessWidget {
  const CodeEditorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EditorTheme.of(context).background3,
      child: GestureDetector(
        onTap: () {
          context.read<CodeEditorCubit>().unfocus();
        },
        child: BlocBuilder<StatementsBuilderCubit, StatementsBuilderState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final builder = state.statements[index];

                    Widget builderWidget = Container();
                    if (builder is DeclareVariableBuilder) {
                      builderWidget = DeclareVariableBuilderWidget(builder: builder);
                    } else if (builder is DeclareVariablesBuilder) {
                      builderWidget = DeclareVariablesBuilderWidget(builder: builder);
                    } else if (builder is PrintBuilder) {
                      builderWidget = PrintBuilderWidget(builder: builder);
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
                              child: Text("${index + 1}",
                                  style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.end),
                            ),
                          ),
                          Material(
                            type: MaterialType.transparency,
                            borderRadius: BorderRadius.circular(8),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: () {
                                context.read<CodeEditorCubit>().focus(builder);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: builderWidget,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, childCount: state.statements.length),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
