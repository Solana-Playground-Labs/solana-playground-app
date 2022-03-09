import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'command_inspector_cubit.dart';

class CommandInspectorWidget
    extends CubitWidget<CommandInspectorCubit, CommandInspectorState> {
  final BlockCommandBuilder? blockCommandBuilder;
  final CommandBuilder builder;

  CommandInspectorWidget({
    Key? key,
    required this.builder,
    this.blockCommandBuilder,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, CommandInspectorState state) {
    return Container();
  }

  @override
  CommandInspectorCubit cubit(BuildContext context) =>
      CommandInspectorCubit(builder);
}
