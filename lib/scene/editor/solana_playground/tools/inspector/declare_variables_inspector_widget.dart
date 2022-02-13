import 'package:flutter/material.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class DeclareVariablesInspectorWidget extends StatelessWidget {
  final DeclareVariablesBuilder builder;

  DeclareVariablesInspectorWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
          onPressed: () {
            builder.appendChild();
          },
          child: const Text("Add variable"),
        ),
      ],
    );
  }
}
