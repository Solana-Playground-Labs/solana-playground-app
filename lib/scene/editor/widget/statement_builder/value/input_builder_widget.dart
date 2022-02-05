import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class InputValueBuilderWidget extends StatefulWidget {
  final ReadValueBuilder builder;

  InputValueBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  State<InputValueBuilderWidget> createState() => _InputValueBuilderWidgetState();
}

class _InputValueBuilderWidgetState extends State<InputValueBuilderWidget> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: FocusableActionDetector(
        focusNode: focusNode,
        child: const SPLabel(
          style: SPLabelStyle.purple,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Input"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
