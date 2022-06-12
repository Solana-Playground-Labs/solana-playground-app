/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/model/keypair.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/cubit/keypairs_cubit.dart';

import 'key_widget.dart';

class WalletsSection extends StatelessWidget {
  const WalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KeypairsCubit>(
      create: (context) => KeypairsCubit(context.read()),
      child: BlocBuilder<KeypairsCubit, WalletsState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: state.keypairs.length + 1,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              late Widget child;

              if (index > 0) {
                final wallet = state.keypairs[index - 1];
                child = KeypairWidget(keypair: wallet);
              } else {
                child = InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("New wallet"),
                          content: const Text("Choose your action"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await context.popRoute();
                                  context.router
                                      .push(CreateKeyPairRoute());
                                },
                                child: const Text("Create")),
                            TextButton(
                                onPressed: () async {
                                  await context.popRoute();
                                  context.router
                                      .push(const ImportWalletRoute());
                                },
                                child: const Text("Import")),
                            TextButton(
                                onPressed: () => context.popRoute(),
                                child: const Text("Cancel")),
                          ],
                        );
                      },
                    );
                  },
                  child: DottedBorder(
                    strokeWidth: 1,
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [6, 2],
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("New wallet"),
                      ),
                    ),
                  ),
                );
              }

              return SizedBox(
                width: 240,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}

class KeypairWidget extends StatelessWidget {
  const KeypairWidget({
    Key? key,
    required this.keypair,
  }) : super(key: key);

  final Keypair keypair;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          context.router.push(WalletDetailRoute(keypair: keypair));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(keypair.name),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    child: Center(
                      child: KeyWidget(
                        text: keypair.publicKeyBase58,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
