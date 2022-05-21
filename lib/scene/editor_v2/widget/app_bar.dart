/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';

class EditorAppBar extends StatelessWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 20),
                  Container(width: 46, height: 46, color: Colors.blue),
                  Container(width: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: TextField(
                      controller: context
                          .read<PackageNameCubit>()
                          .textEditorController,
                      style: theme.textTheme.headline1,
                      decoration:
                          const InputDecoration.collapsed(hintText: "Name"),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.ios_share),
                    tooltip: "Share code",
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow_rounded),
                    tooltip: "Run",
                    color: Colors.blue,
                  ),
                  Container(width: 20)
                ],
              ),
            ),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
