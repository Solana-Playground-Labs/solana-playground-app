/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/command_builder.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';

part 'comment_command.builder.dart';

@CommandBuildable()
class CommentCommand extends Command {
  @CommandPropertyBuildable()
  final String content;

  const CommentCommand({required this.content});

  @override
  List<Object?> get props => [content];

  factory CommentCommand.fromJson(Map<String, dynamic> json) =>
      _$CommentCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentCommandToJson(this);

  @override
  CommentCommandBuilder asBuilder() => _$CommentCommandToBuilder(this);
}
