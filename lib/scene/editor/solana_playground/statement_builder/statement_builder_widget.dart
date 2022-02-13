import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'declare_variable/declare_variable_builder_widget.dart';
import 'declare_variables/declare_variables_builder_widget.dart';
import 'print/print_builder_widget.dart';

Widget _mapping(StatementBuilder builder) {
  Widget widget = Container();

  if (builder is DeclareVariableBuilder) {
    widget = DeclareVariableBuilderWidget(builder: builder);
  } else if (builder is DeclareVariablesBuilder) {
    widget = DeclareVariablesBuilderWidget(builder: builder);
  } else if (builder is PrintBuilder) {
    widget = PrintBuilderWidget(builder: builder);
  }

  return widget;
}

class StatementBuilderWidget extends StatelessWidget {
  final StatementBuilder builder;

  StatementBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return _mapping(builder);
  }
}