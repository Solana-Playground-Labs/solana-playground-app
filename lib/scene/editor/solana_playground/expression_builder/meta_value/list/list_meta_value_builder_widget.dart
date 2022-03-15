/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';

import 'list_meta_value_builder_cubit.dart';

class ListMetaValueBuilderWidget
    extends CubitWidget<ListMetaValueBuilderCubit, ListMetaValueBuilderState> {
  final ListMetaValueBuilder builder;
  final Widget Function(BuildContext context, dynamic data) widgetBuilder;
  final VoidCallback onAdd;

  ListMetaValueBuilderWidget({
    Key? key,
    required this.builder,
    required this.widgetBuilder,
    required this.onAdd,
  }) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, ListMetaValueBuilderState state) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: SPCard(
        level: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.builders.isEmpty)
              Text("Empty", style: theme.textTheme.caption),
            ...state.builders.map(
              (e) => Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minHeight: 0),
                        onPressed: () {
                          context.read<ListMetaValueBuilderCubit>().moveDown(e);
                        },
                        icon: const Icon(Icons.arrow_circle_up_outlined),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minHeight: 0),
                        onPressed: () {
                          context.read<ListMetaValueBuilderCubit>().moveUp(e);
                        },
                        icon: const Icon(Icons.arrow_circle_down_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: widgetBuilder(context, e),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minHeight: 0),
                        onPressed: () {
                          context.read<ListMetaValueBuilderCubit>().remove(e);
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const IntrinsicWidth(child: Divider()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(minHeight: 0),
                  onPressed: () {
                    onAdd();
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ListMetaValueBuilderCubit cubit(BuildContext context) =>
      ListMetaValueBuilderCubit(builder);
}

// import 'package:flutter/material.dart';
// import 'package:solana_playground_app/common/card.dart';
// import 'package:solana_playground_language/solana_playground_language.dart';
//
// class ListMetaBuilderWidget extends StatefulWidget {
//   final ListMetaValueBuilder builder;
//   final Widget Function(BuildContext context, dynamic data) widgetBuilder;
//   final VoidCallback onAdd;
//
//   ListMetaBuilderWidget({
//     Key? key,
//     required this.builder,
//     required this.widgetBuilder,
//     required this.onAdd,
//   }) : super(key: Key(builder.id));
//
//   @override
//   State<ListMetaBuilderWidget> createState() => _ListMetaBuilderWidgetState();
// }
//
// class _ListMetaBuilderWidgetState extends State<ListMetaBuilderWidget> {
//   @override
//   void initState() {
//     widget.builder.addListener(listener);
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(ListMetaBuilderWidget oldWidget) {
//     oldWidget.builder.removeListener(listener);
//     widget.builder.addListener(listener);
//     super.didUpdateWidget(oldWidget);
//   }
//
//   void listener() {
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
