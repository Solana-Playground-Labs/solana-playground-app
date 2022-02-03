import 'package:flutter/material.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: EditorTheme.of(context).background2,
      child: const Center(
        child: Text("Left panel"),
      ),
    );
  }
}
