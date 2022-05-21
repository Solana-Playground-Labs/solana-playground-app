/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/model/focus_builder.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../cubit/cubit.dart';
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
        return mapping(context, focusBuilder);
      },
    );
  }

  Widget mapping(BuildContext context, FocusBuilder focusBuilder) {
    Widget widget = Container();

    if (focusBuilder is ExpressionFocusBuilder) {
      widget = ExpressionInspectorWidget(
        label: focusBuilder.label,
        builder: focusBuilder.builder as ExpressionBuilder,
      );
    } else if (focusBuilder is CommandFocusBuilder) {
      widget = Container();
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
