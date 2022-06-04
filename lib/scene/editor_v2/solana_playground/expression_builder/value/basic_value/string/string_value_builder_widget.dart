/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/lib.dart';

class StringValueBuilderWidget extends StatelessWidget {
  final StringValueBuilder builder;

  const StringValueBuilderWidget({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleTextFieldValueBuilderWidget<StringValueBuilder>(
      adapter: SingleTextFieldValueBuilderAdapter<StringValueBuilder>(
        builder: builder,
        getTextBuilder: (builder) => builder.value,
        setTextBuilder: (builder, value) => builder.value = value,
      ),
    );
  }
}
