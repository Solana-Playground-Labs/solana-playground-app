import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/command.dart';
import 'package:solana_playground_language/src/core/command/comment_command.dart';

class CommendCommandBuilder extends CommandBuilder {
  final String content;

  CommendCommandBuilder({required this.content});

  @override
  CommendCommandBuilder clone() {
    return CommendCommandBuilder(content: content);
  }

  @override
  Command build() {
    return CommentCommand(content: content);
  }
}
