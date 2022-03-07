import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/command_builder/block_command_builder_widget.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';

class CodeEditorPanel extends CubitWidget<CodeEditorCubit, CodeEditorState> {
  const CodeEditorPanel({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, CodeEditorState state) {
    return Container(
      color: EditorTheme.of(context).background3,
      child: GestureDetector(
          onTap: () {
            context.read<CodeEditorCubit>().unfocus();
          },
          child: Scrollbar(
            child: CustomScrollView(
              slivers: [
                if (state.currentScript != null)
                  BlockCommandBuilderWidget(
                      builder: state.currentScript!.blockCommandBuilder),
              ],
            ),
          )),
    );
  }
}
