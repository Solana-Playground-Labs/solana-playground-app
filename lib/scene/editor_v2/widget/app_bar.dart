/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solana_playground_app/common/component/network/network_label.dart';
import 'package:solana_playground_app/route/app_router.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';

import 'short_name_widget.dart';

class EditorAppBar extends StatelessWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
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
                    IconButton(
                      onPressed: () async {
                        try {
                          await context
                              .read<CodeEditorCubit>()
                              .packageEditController
                              .save();
                          context.router.pop();
                        } catch (e) {
                          // TODO: Replace snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios_outlined),
                    ),
                    Container(width: 8),
                    const SPPackageIconWidget(),
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
                    const NetworkLabel(),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        context.router.push(const KeypairsListRoute());
                      },
                      icon: const Icon(Icons.account_balance_wallet_outlined),
                      tooltip: "Keypair storage",
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () async {
                        final package = context
                            .read<CodeEditorCubit>()
                            .packageEditController
                            .currentBuilder
                            .build();

                        final jsonData =
                            const JsonEncoder().convert(package.toJson());

                        final file = File(
                            '${Directory.systemTemp.path}/${package.name}.json');
                        await file.writeAsString(jsonData);

                        Share.shareFiles(
                          [file.path],
                          text: 'Solana Playground - ${package.name}',
                        );
                      },
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
      ),
    );
  }
}
