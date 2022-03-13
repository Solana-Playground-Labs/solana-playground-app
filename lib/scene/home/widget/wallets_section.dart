import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/cubit/wallets_cubit.dart';

import 'key_widget.dart';

class WalletsSection extends StatelessWidget {
  const WalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletsCubit>(
      create: (context) => WalletsCubit(context.read()),
      child: BlocBuilder<WalletsCubit, WalletsState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: state.wallets.length + 1,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              late Widget child;

              if (index < state.wallets.length) {
                final wallet = state.wallets[index];
                child = WalletWidget(wallet: wallet);
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
                                      .push(const CreateWalletRoute());
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

class WalletWidget extends StatelessWidget {
  const WalletWidget({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      padding: EdgeInsets.zero,
      child: FutureBuilder<String>(
        future: wallet.address,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final text = snapshot.data!;
          return InkWell(
            onTap: () {
              context.router.push(WalletDetailRoute(wallet: wallet));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(wallet.name),
                      const Spacer(),
                      FutureBuilder<int>(
                        future:
                            context.read<SolanaClient>().rpcClient.getBalance(text),
                        builder: (context, state) {
                          if (!state.hasData) return Container();
                          return Text("${state.data!.toString()} SOL");
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SPCard(
                        level: 2,
                        child: Center(
                          child: KeyWidget(text: text),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
