/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Route<T> popover<T>(BuildContext context, Widget child, CustomPage page) {
  return RawDialogRoute(
    pageBuilder: (context, animation, secondAnimation) {
      final viewInsets = MediaQuery.of(context).viewInsets;

      return Padding(
        padding: viewInsets,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: child,
              ),
            ),
          ),
        ),
      );
    },
    settings: page,
  );
}

Route<T> popoverWide<T>(BuildContext context, Widget child, CustomPage page) {
  return RawDialogRoute(
    pageBuilder: (context, animation, secondAnimation) {
      final viewInsets = MediaQuery.of(context).viewInsets;

      return Padding(
        padding: viewInsets,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: child,
              ),
            ),
          ),
        ),
      );
    },
    settings: page,
  );
}
