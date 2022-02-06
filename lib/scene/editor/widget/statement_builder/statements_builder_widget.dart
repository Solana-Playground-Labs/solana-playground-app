import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statements_builder.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/statements_builder_cubit.dart';

class StatementsBuilderWidget extends CubitWidget<StatementsBuilderCubit, StatementsBuilderState> {
  const StatementsBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, StatementsBuilderState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final builder = state.statements[index];
        Widget builderWidget = StatementsBuilder.mapping(builder);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 20),
                  child: Text("${index + 1}", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.end),
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
    );
  }

  @override
  cubit(BuildContext context) => StatementsBuilderCubit(context.read<CodeEditorCubit>().programBuilder);
}
