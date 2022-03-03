import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../tools.dart';
import 'expression/expression_inspector_widget.dart';

class InspectorBuilderWidget extends StatelessWidget {
  const InspectorBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      buildWhen: (p, n) => p.focusBuilder != n.focusBuilder,
      builder: (context, state) {
        final focusBuilder = state.focusBuilder;
        if (focusBuilder == null) return Container();
        return mapping(context, focusBuilder.builder);
      },
    );
  }

  Widget mapping(BuildContext context, Builder builder) {
    final theme = Theme.of(context);
    Widget widget = Container();

    if (builder is ExpressionBuilder) {
      widget = ExpressionInspectorWidget(builder: builder);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Inspector", style: Theme.of(context).textTheme.headline6),
              Text(
                builder.runtimeType.toString(),
                style: theme.textTheme.caption,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: widget,
          ),
        ),
      ],
    );
  }
}
