/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/solana.dart' hide Wallet;
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/model/keypair.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/wallet/cubit/wallet_detail_cubit.dart';
import 'package:solana_playground_app/scene/home/widget/key_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletDetailView extends StatelessWidget {
  final Keypair keypair;

  const WalletDetailView({Key? key, required this.keypair}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletDetailCubit>(
      create: (context) => WalletDetailCubit(context.read(), keypair)..fetch(),
      child: Builder(builder: (context) => content(context)),
    );
  }

  Widget content(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keypair.name),
      ),
      body: BlocBuilder<WalletDetailCubit, WalletDetailState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Cell(
                title: const Text("Address"),
                content: state.address == null
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: state.address));
                        },
                        child: KeyWidget(text: state.address!),
                      ),
              ),
              if (keypair.mnemonic != null)
                _Cell(
                  title: const Text("Mnemonic"),
                  content: state.address == null
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: keypair.mnemonic!.phrase));
                          },
                          child: Text(keypair.mnemonic!.phrase),
                        ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Cell(
                    title: const Text("Balance (SOL)"),
                    content: Text(
                      state.account?.lamports.toString() ??
                          (state.isFetching ? "Loading..." : "Not found"),
                    ),
                  ),
                  _Cell(
                    title: const Text("Executable"),
                    content: Text(
                      state.account?.executable.toString() ??
                          (state.isFetching ? "Loading..." : "Not found"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Actions", style: Theme.of(context).textTheme.headline6),
              ),
              Row(
                children: [
                  WalletActionWidget(
                      title: "Refresh",
                      onTap: () {
                        context.read<WalletDetailCubit>().fetch();
                      }),
                  WalletActionWidget(
                    title: "Airdrop",
                    onTap: () => context.router.push(AirdropRoute(keypair: keypair)),
                  ),
                  WalletActionWidget(
                      title: "Open in Solana explorer",
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            "https://explorer.solana.com/address/${state.address ?? ""}?cluster=devnet",
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      }),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class WalletActionWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const WalletActionWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            height: 80,
            child: SPCard(
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final Widget title;
  final Widget content;

  const _Cell({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 8),
                title,
                const Spacer(),
                content,
                const SizedBox(width: 8),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
