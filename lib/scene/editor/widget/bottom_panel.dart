import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';

import '../solana_playground/tools/console/console_widget.dart';
import '../solana_playground/tools/message/message_widget.dart';

class BottomPanel extends CubitWidget<CodeEditorCubit, CodeEditorState> {
  const BottomPanel({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, CodeEditorState state) {
    if (state.isBottomPanelHidden) return Container();

    return SizedBox(
      height: 150,
      child: Row(
        children: const [
          Expanded(child: ConsoleWidget()),
          VerticalDivider(),
          Expanded(child: MessageWidget()),
        ],
      ),
    );
  }
}
