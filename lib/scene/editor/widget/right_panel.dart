import 'package:flutter/material.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

import '../solana_playground/tools/inspector/inspector.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: EditorTheme.of(context).background2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          // Expanded(child: StatementTemplatesWidget()),
          // Divider(),
          Expanded(child: InspectorBuilderWidget()),
        ],
      ),
    );
  }
}
