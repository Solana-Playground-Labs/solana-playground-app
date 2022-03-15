/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/command_builder.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';

class CommentCommand extends Command {
  final String content;

  const CommentCommand({required this.content});

  @override
  List<Object?> get props => [content];

  factory CommentCommand.fromJson(Map<String, dynamic> json) {
    return CommentCommand(content: json['content']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "type": classType,
        "content": content,
      };

  @override
  CommendCommandBuilder asBuilder() {
    return CommendCommandBuilder(content: content);
  }
}
