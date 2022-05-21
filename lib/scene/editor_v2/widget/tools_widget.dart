/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/tools/command_templates_widget.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      constraints: const BoxConstraints(maxWidth: 300),
      child: const CommandTemplatesWidget(),
    );
  }
}
