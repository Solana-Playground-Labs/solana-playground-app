import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

Widget _mapping(CommandBuilder builder) {
  Widget widget = Container();

  return widget;
}

class StatementBuilderWidget extends StatelessWidget {
  final CommandBuilder builder;

  StatementBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return _mapping(builder);
  }
}