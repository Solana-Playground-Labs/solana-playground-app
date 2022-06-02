/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Route<T> popover<T>(BuildContext context, Widget child, CustomPage page) {
  return RawDialogRoute(
    pageBuilder: (context, animation, secondAnimation) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: child,
          ),
        ),
      );
    },
    settings: page,
  );
}
