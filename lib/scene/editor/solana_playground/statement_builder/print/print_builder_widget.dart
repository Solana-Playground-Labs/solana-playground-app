import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/common/statement_builder_focus.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../statement_builder_action.dart';
import '../value/value_root_builder_widget.dart';
import 'print_builder_cubit.dart';

class PrintBuilderWidget extends CubitWidget<PrintBuilderCubit, PrintBuilderState> {
  final PrintBuilder builder;

  PrintBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, PrintBuilderState state) {
    final theme = Theme.of(context);

    return StatementBuilderFocus(
      statementBuilder: builder,
      builder: (context, isFocus) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Print", style: theme.textTheme.headline6),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.valueRootBuilders.map(
                (valueRootBuilder) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicWidth(child: ValueRootBuilderWidget(rootBuilder: valueRootBuilder)),
                      if (isFocus)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              context.read<PrintBuilderCubit>().remove(valueRootBuilder);
                            },
                            icon: const Icon(Icons.remove, color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (isFocus) StatementBuilderAction(builder: builder),
            ],
          )
        ],
      ),
    );
  }

  @override
  PrintBuilderCubit cubit(BuildContext context) => PrintBuilderCubit(builder);
}
