import 'package:flutter/material.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';

class BottomPanel extends CubitWidget<CodeEditorCubit, CodeEditorState> {
  const BottomPanel({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, CodeEditorState state) {
    if (state.isBottomPanelHidden) return Container();

    return const SizedBox(
      height: 120,
      child: Center(
        child: Text("Hello"),
      ),
    );
  }
}
