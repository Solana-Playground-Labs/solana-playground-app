import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class ListMetaBuilderWidget extends StatefulWidget {
  final ListMetaValueBuilder builder;
  final Widget Function(BuildContext context, dynamic data) widgetBuilder;
  final VoidCallback onAdd;

  ListMetaBuilderWidget({
    Key? key,
    required this.builder,
    required this.widgetBuilder,
    required this.onAdd,
  }) : super(key: Key(builder.id));

  @override
  State<ListMetaBuilderWidget> createState() => _ListMetaBuilderWidgetState();
}

class _ListMetaBuilderWidgetState extends State<ListMetaBuilderWidget> {
  @override
  void initState() {
    widget.builder.addListener(listener);
    super.initState();
  }

  @override
  void didUpdateWidget(ListMetaBuilderWidget oldWidget) {
    oldWidget.builder.removeListener(listener);
    widget.builder.addListener(listener);
    super.didUpdateWidget(oldWidget);
  }

  void listener() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: SPCard(
        level: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.builder.data.isEmpty)
              Text("Empty", style: theme.textTheme.caption),
            ...widget.builder.data.map(
              (e) => Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minHeight: 0),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_up_outlined),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minHeight: 0),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_down_outlined),
                      )
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: widget.widgetBuilder(context, e),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const IntrinsicWidth(child: Divider()),
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(minHeight: 0),
                  onPressed: () {
                    widget.onAdd();
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
}
