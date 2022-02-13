import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/stack.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/statement_builder/block_builder_cubit.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'statement_builder_widget.dart';
import 'statement_feedback.dart';

class StatementBuilderDraggable extends StatefulWidget {
  final StatementBuilder builder;
  final Widget child;

  StatementBuilderDraggable({Key? key, required this.builder, required this.child}) : super(key: Key(builder.id));

  @override
  State<StatementBuilderDraggable> createState() => _StatementBuilderDraggableState();
}

class _StatementBuilderDraggableState extends State<StatementBuilderDraggable> {
  bool? acceptUp;
  bool? acceptDown;
  StatementBuilder? dropUp;
  StatementBuilder? dropDown;

  static const double _leftDropWidgetSpace = 44.0;

  @override
  Widget build(BuildContext context) {
    return SPStack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (dropUp != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: _leftDropWidgetSpace),
                  child: StatementBuilderWidget(builder: dropUp!),
                ),
              Draggable<StatementBuilder>(
                key: Key(widget.builder.id),
                data: widget.builder,
                feedback: StatementFeedback(builder: widget.builder),
                onDragCompleted: () {

                },
                child: widget.child,
                childWhenDragging: Opacity(
                  opacity: 0.2,
                  child: widget.child,
                ),
              ),
              if (dropDown != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: _leftDropWidgetSpace),
                  child: StatementBuilderWidget(builder: dropDown!),
                ),
            ],
          ),
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
    return DragTarget<StatementBuilder>(
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
        context.read<BlockBuilderCubit>().insertBefore(widget.builder, drag.data);
        setState(() => dropUp = null);
      },
      builder: (context, candidateData, rejectedData) {
        return Container();
      },
    );
  }

  Widget bottomArea(BuildContext context) {
    return DragTarget<StatementBuilder>(
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
        context.read<BlockBuilderCubit>().insertAfter(widget.builder, drag.data);
        setState(() => dropDown = null);
      },
      builder: (context, candidateData, rejectedData) {
        return Container();
      },
    );
  }
}
