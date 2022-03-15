/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class CommandFeedback extends StatelessWidget {
  final CommandBuilder builder;

  const CommandFeedback({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SPCard(
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
