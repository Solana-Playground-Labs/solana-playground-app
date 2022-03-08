import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class PrintCommandBuilderWidget extends StatelessWidget {
  final PrintCommandBuilder builder;

  PrintCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SPCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Print", style: theme.textTheme.bodyText1),
          const SizedBox(width: 12),
          Flexible(child: ExpressionBuilderWidget(builder: builder.expression)),
        ],
      ),
    );
  }
}
