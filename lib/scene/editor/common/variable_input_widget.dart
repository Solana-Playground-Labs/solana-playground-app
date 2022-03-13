import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';

class VariableInputWidget extends StatelessWidget {
  final TextEditingController? controller;

  const VariableInputWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SPLabel(
      style: SPLabelStyle.orange,
      child: TextField(
        controller: controller,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.black),
        decoration: SPTextField.compactInputDecoration.copyWith(
          constraints: const BoxConstraints(),
          hintText: "Variable",
        ),
      ),
    );
  }
}
