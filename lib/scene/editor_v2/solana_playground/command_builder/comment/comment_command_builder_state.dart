/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'comment_command_builder_cubit.dart';

class CommentCommandBuilderState extends Equatable {
  final bool editorMode;

  const CommentCommandBuilderState({this.editorMode = false});

  @override
  List<Object> get props => [editorMode];

  CommentCommandBuilderState copyWith({
    bool? editorMode,
  }) {
    return CommentCommandBuilderState(
      editorMode: editorMode ?? this.editorMode,
    );
  }
}