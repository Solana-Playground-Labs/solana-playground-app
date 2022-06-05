/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class CommandFeedback extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final CommandBuilder builder;

  const CommandFeedback({
    Key? key,
    this.icon,
    this.title,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SPCard(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                title ?? builder.runtimeType.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
