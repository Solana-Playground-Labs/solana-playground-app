/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/stack.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'block_command_builder_cubit.dart';
import 'command_builder_widget.dart';
import 'command_feedback.dart';

class CommandBuilderDraggable extends StatefulWidget {
  final CommandBuilder builder;
  final Widget child;

  CommandBuilderDraggable(
      {Key? key, required this.builder, required this.child})
      : super(key: Key(builder.id));

  @override
  State<CommandBuilderDraggable> createState() =>
      _CommandBuilderDraggableState();
}

class _CommandBuilderDraggableState extends State<CommandBuilderDraggable> {
  bool? acceptUp;
  bool? acceptDown;
  CommandBuilder? dropUp;
  CommandBuilder? dropDown;

  static const double _leftDropWidgetSpace = 44.0;

  @override
  Widget build(BuildContext context) {
    return SPStack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dropUp != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Opacity(
                  opacity: 0.7,
                  child: CommandBuilderWidget(builder: dropUp!),
                ),
              ),
            Draggable<CommandBuilder>(
              key: Key(widget.builder.id),
              data: widget.builder,
              feedback: CommandFeedback(builder: widget.builder),
              childWhenDragging: Opacity(
                opacity: 0.2,
                child: widget.child,
              ),
              child: widget.child,
            ),
            if (dropDown != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Opacity(
                  opacity: 0.7,
                  child: CommandBuilderWidget(builder: dropDown!),
                ),
              ),
          ],
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: topArea(context)),
              Expanded(child: bottomArea(context)),
            ],
          ),
        ),
      ],
    );
  }

  Widget topArea(BuildContext context) {
    return DragTarget<CommandBuilder>(
      onWillAccept: (data) {
        return data != widget.builder;
      },
      onMove: (drag) {
        if (drag.data != widget.builder) setState(() => dropUp = drag.data);
      },
      onLeave: (drag) {
        setState(() => dropUp = null);
      },
      onAcceptWithDetails: (drag) {
        context
            .read<BlockCommandBuilderCubit>()
            .insertBefore(widget.builder, drag.data);
        setState(() => dropUp = null);
      },
      builder: (context, candidateData, rejectedData) {
        return Container();
      },
    );
  }

  Widget bottomArea(BuildContext context) {
    return DragTarget<CommandBuilder>(
      onWillAccept: (data) {
        return data != widget.builder;
      },
      onMove: (drag) {
        if (drag.data != widget.builder) setState(() => dropDown = drag.data);
      },
      onLeave: (drag) {
        setState(() => dropDown = null);
      },
      onAcceptWithDetails: (drag) {
        context
            .read<BlockCommandBuilderCubit>()
            .insertAfter(widget.builder, drag.data);
        setState(() => dropDown = null);
      },
      builder: (context, candidateData, rejectedData) {
        return Container();
      },
    );
  }
}
