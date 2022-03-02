import 'package:solana_playground_language/src/core/command/command.dart';

class CommentCommand extends Command {
  final String content;

  const CommentCommand({required this.content});

  @override
  List<Object?> get props => [content];
}