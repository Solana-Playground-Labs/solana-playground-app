import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../tools.dart';

class InspectorBuilderWidget extends StatelessWidget {
  const InspectorBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorCubit, CodeEditorState>(
      buildWhen: (p, n) => p.focusedBuilder != n.focusedBuilder,
      builder: (context, state) {
        final statementBuilder = state.focusedBuilder;
        if (statementBuilder == null) return Container();
        return mapping(context, statementBuilder);
      },
    );
  }

  Widget mapping(BuildContext context, Builder builder) {
    Widget widget = Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("Inspector", style: Theme.of(context).textTheme.headline6),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: widget,
        )),
      ],
    );
  }
}
