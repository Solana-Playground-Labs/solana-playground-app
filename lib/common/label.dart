/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

enum SPLabelStyle { blue, green, orange, purple, grey, red, keppel }

Color _styleToColor(SPLabelStyle style) {
  switch (style) {
    case SPLabelStyle.blue:
      return const Color.fromRGBO(133, 183, 237, 1);
    case SPLabelStyle.green:
      return const Color.fromRGBO(112, 237, 157, 1);
    case SPLabelStyle.orange:
      return const Color.fromRGBO(255, 163, 97, 1);
    case SPLabelStyle.grey:
      return const Color.fromRGBO(106, 106, 106, 1.0);
    case SPLabelStyle.keppel:
      return const Color.fromRGBO(70, 173, 172, 1.0);
    case SPLabelStyle.red:
      return const Color.fromRGBO(248, 91, 91, 1.0);
    case SPLabelStyle.purple:
      return const Color.fromRGBO(227, 165, 219, 1.0);
  }
}

class SPLabel extends StatelessWidget {
  final SPLabelStyle style;
  final Widget child;

  const SPLabel({
    Key? key,
    this.style = SPLabelStyle.blue,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
      child: Container(
        clipBehavior: Clip.hardEdge,
        constraints: const BoxConstraints(
          minHeight: 30,
        ),
        decoration: BoxDecoration(
          color: _styleToColor(style),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Material(
            type: MaterialType.transparency,
            child: child,
          ),
        ),
      ),
    );
  }
}
