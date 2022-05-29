/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

abstract class ValueBuilder extends Builder {
  Value build();

  String get name => runtimeType.toString();

  @override
  ValueBuilder clone();
}
