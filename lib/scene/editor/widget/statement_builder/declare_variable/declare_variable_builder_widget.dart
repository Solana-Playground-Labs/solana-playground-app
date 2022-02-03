import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/code.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class DeclareVariableBuilderWidget extends StatelessWidget {
  final DeclareVariableBuilder declareVariableBuilder;

  const DeclareVariableBuilderWidget({Key? key, required this.declareVariableBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicWidth(
          child: PGLabel(
            style: PGLabelStyle.orange,
            child: TextField(
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
              decoration: SPTextField.compactInputDecoration.copyWith(
                hintText: "Variable name"
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset("assets/icon/equal.svg"),
        ),
        IntrinsicWidth(
          child: PGLabel(
            style: PGLabelStyle.green,
            child: TextField(
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
              decoration: SPTextField.compactInputDecoration.copyWith(
                hintText: "Constant value"
              ),
            ),
          ),
        ),
      ],
    );
  }
}
