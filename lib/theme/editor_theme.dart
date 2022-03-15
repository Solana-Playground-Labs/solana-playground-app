/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditorTheme extends StatelessWidget {
  final EditorThemeData themeData;
  final Widget child;

  const EditorTheme({Key? key, required this.themeData, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: themeData, child: child);
  }

  static EditorThemeData of(BuildContext context) {
    return Provider.of<EditorThemeData>(context, listen: false);
  }
}

class EditorThemeData {
  final Color appBarColor = Colors.black;
  final Color background1 = const Color.fromRGBO(0, 0, 0, 1);
  final Color background2 = const Color.fromRGBO(29, 29, 29, 1);
  final Color background3 = const Color.fromRGBO(42, 42, 42, 1);
}
