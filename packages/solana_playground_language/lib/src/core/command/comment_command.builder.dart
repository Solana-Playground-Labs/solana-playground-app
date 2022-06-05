// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class CommentCommandBuilder extends CommandBuilder {
  String _content;

  String get content => _content;

  set content(String value) {
    _content = value;
    notifyListeners();
  }

  CommentCommandBuilder({
    required String content,
  }) : _content = content;

  @override
  CommentCommand build() {
    return CommentCommand(
      content: content,
    );
  }

  @override
  CommentCommandBuilder clone() {
    return CommentCommandBuilder(
      content: content,
    );
  }
}

CommentCommand _$CommentCommandFromJson(Map<String, dynamic> json) {
  return CommentCommand(
    content: json['content'],
  );
}

Map<String, dynamic> _$CommentCommandToJson(CommentCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'content': value.content,
  };
}

CommentCommandBuilder _$CommentCommandToBuilder(CommentCommand value) {
  return CommentCommandBuilder(content: value.content);
}
