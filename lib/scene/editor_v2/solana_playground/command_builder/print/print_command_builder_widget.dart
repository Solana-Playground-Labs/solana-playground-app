/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../../editor_v2.dart';

class PrintCommandBuilderWidget extends StatelessWidget {
  final PrintCommandBuilder builder;

  PrintCommandBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return Component(
      header: ComponentHeader(
        builder: builder,
        icon: SvgPicture.asset(SPIcons.info),
        name: "Log",
      ),
      body: [
        ListValueBuilderWidget(builder: builder.expressions),
      ],
    );
  }
}
