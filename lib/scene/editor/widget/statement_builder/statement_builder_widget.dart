import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'statements_builder.dart';

class StatementBuilderWidget extends StatelessWidget {
  final StatementBuilder builder;

  StatementBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return StatementsBuilder.mapping(builder);
  }
}
