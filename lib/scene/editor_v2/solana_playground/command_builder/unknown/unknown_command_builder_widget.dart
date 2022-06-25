/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class UnknownCommandWidget extends StatelessWidget {
  final CommandBuilder builder;
  final CommandBuilderMetaInfo? metaInfo;

  const UnknownCommandWidget({
    Key? key,
    required this.builder,
    this.metaInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(builder.build().toJson());

    return ComponentHeader(
      icon: SvgPicture.asset(SPIconAssets.error),
      name: commandHeaderFormatter("Unknown command", metaInfo),
      content: Text(prettyprint),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Unknown command", style: theme.textTheme.headline6),
        Text(
          "Runtime object: ${builder.runtimeType.toString()}",
          style: theme.textTheme.caption,
        ),
      ],
    );
  }
}
