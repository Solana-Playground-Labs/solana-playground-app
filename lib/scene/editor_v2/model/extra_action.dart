/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExtraAction extends Equatable {
  final Widget child;
  final VoidCallback onTap;

  const ExtraAction({
    required this.child,
    required this.onTap,
  });

  @override
  List<Object> get props => [child, onTap];
}

class ExtraActionWidget extends StatelessWidget {
  const ExtraActionWidget({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<ExtraAction?> Function(BuildContext context)? actions;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExtraAction>(
      splashRadius: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.more_vert_rounded, color: Colors.grey),
      itemBuilder: (context) {
        return [
          if (actions != null)
            ...actions!(context).whereType<ExtraAction>().map((e) {
              return PopupMenuItem<ExtraAction>(
                onTap: e.onTap,
                child: e.child,
              );
            }).toList(),
        ];
      },
    );
  }
}
