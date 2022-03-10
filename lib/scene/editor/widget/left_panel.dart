import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

import '../solana_playground/tools/command_templates_widget.dart';

class LeftPanel extends CubitWidget<CodeEditorCubit, CodeEditorState> {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, CodeEditorState state) {
    if (state.isLeftPanelHidden) return Container();

    return Container(
      width: 240,
      color: EditorTheme.of(context).background2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(child: CommandTemplatesWidget()),
        ],
      ),
    );
  }
}
