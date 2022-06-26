/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/icon_button.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:url_launcher/url_launcher.dart';

import 'comment_command_builder_cubit.dart';

class CommentCommandBuilderWidget
    extends CubitWidget<CommentCommandBuilderCubit, CommentCommandBuilderState> {
  final CommentCommandBuilder builder;
  final CommandBuilderMetaInfo? metaInfo;

  CommentCommandBuilderWidget({Key? key, required this.builder, this.metaInfo})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, CommentCommandBuilderState state) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: state.editorMode
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: context.read<CommentCommandBuilderCubit>().commentInputController,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Tap to edit",
                      ),
                      minLines: 1,
                      maxLines: 20,
                    ),
                  ),
                )
              : MarkdownBody(
                  selectable: true,
                  onTapLink: (text, href, title) {
                    if (href == null) return;
                    launchUrl(
                      Uri.parse(href),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  data: builder.content.isNotEmpty ? builder.content : "Empty",
                ),
        ),
        ComponentHeader(
          icon: SvgPicture.asset(SPIconAssets.comment),
          name: commandHeaderFormatter("Comment", metaInfo),
          trailing: CommandBuilderAction(
            builder: builder,
            actions: [
              SPIconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                    size: 20,
                  ),
                  onPressed: () {
                    context.read<CommentCommandBuilderCubit>().toggleEditorMode();
                  }),
            ],
          ),
        ),
      ],
    );
  }

  @override
  CommentCommandBuilderCubit cubit(BuildContext context) => CommentCommandBuilderCubit(builder);
}
