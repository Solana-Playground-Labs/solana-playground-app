/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

String commandHeaderFormatter(String name, CommandBuilderMetaInfo? metaInfo) {
  String prefix = "";
  if (metaInfo?.index != null) {
    prefix = "${metaInfo!.index! + 1}. ";
  }

  return prefix + name;
}