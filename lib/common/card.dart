/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class SPCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  const SPCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.08),
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
