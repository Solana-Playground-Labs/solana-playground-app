import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class StatementFeedback extends StatelessWidget {
  final StatementBuilder builder;

  const StatementFeedback({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: PGCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            builder.runtimeType.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
