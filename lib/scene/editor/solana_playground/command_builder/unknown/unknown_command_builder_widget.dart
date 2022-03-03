import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class UnknownCommandWidget extends StatelessWidget {
  final CommandBuilder builder;

  const UnknownCommandWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Unknown command", style: theme.textTheme.headline6),
        Text(
          "Runtime object: ${builder.runtimeType.toString()}",
          style: theme.textTheme.caption,
        ),
      ],
    );
  }
}