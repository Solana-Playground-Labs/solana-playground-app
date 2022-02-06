import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor/widget/tools/inspector/inspector_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/tools/statement_templates_widget.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

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
