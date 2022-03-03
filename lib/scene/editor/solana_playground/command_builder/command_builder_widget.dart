import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/declare_variable/declare_variable_command_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/print/print_command_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'unknown/unknown_command_builder_widget.dart';

typedef MappingBuilder = Widget Function(BuildContext context, dynamic);

final Map<Type, MappingBuilder> _mapping = {
  PrintCommandBuilder: (context, builder) =>
      PrintCommandBuilderWidget(builder: builder),
  DeclareVariableCommandBuilder: (context, builder) =>
      DeclareVariableCommandBuilderWidget(builder: builder),
};

class CommandBuilderWidget extends StatelessWidget {
  final CommandBuilder builder;

  CommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final widget = _mapping[builder.runtimeType]?.call(context, builder) ??
        UnknownCommandWidget(builder: builder);

    return widget;
  }
}
