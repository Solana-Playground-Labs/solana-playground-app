/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/lib.dart';

class IntValueBuilderWidget extends StatelessWidget {
  final IntValueBuilder builder;

  const IntValueBuilderWidget({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBuilderWidget<IntValueBuilder>(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
      ],
      adapter: TextFieldBuilderAdapter<IntValueBuilder>(
        builder: builder,
        getTextBuilder: (builder) => builder.value.toString(),
        setTextBuilder: (builder, value) =>
            builder.value = int.tryParse(value) ?? builder.value,
      ),
    );
  }
}
