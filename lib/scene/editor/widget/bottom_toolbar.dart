import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';

class BottomToolBar extends CubitWidget<CodeEditorCubit, CodeEditorState> {
  const BottomToolBar({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, CodeEditorState state) {
    return SafeArea(
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  context.read<CodeEditorCubit>().toggleLeftPanelHidden();
                },
                icon: Icon(state.isLeftPanelHidden
                    ? Icons.menu_outlined
                    : Icons.menu_open)),
            const Spacer(),
            IconButton(
                onPressed: () {
                  context.read<CodeEditorCubit>().toggleBottomPanelHidden();
                },
                icon: Icon(state.isRightPanelHidden
                    ? Icons.local_convenience_store_outlined
                    : Icons.local_convenience_store_outlined)),
            IconButton(
                onPressed: () {
                  context.read<CodeEditorCubit>().toggleRightPanelHidden();
                },
                icon: Icon(state.isRightPanelHidden
                    ? Icons.menu_outlined
                    : Icons.menu_open)),
          ],
        ),
      ),
    );
  }
}
