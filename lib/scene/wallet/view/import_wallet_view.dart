/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/wallet/cubit/import_wallet_cubit.dart';

class ImportWalletView extends StatelessWidget {
  const ImportWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportWalletCubit(context.read()),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Create a new wallet"),
            ),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: context.read<ImportWalletCubit>().nameInput,
                      decoration:
                          const InputDecoration(hintText: "Wallet name"),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller:
                          context.read<ImportWalletCubit>().mnemonicInput,
                      decoration: const InputDecoration(hintText: "Mnemonic"),
                    ),
                    const SizedBox(height: 16),
                    const Text("Derivation path:"),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller:
                                context.read<ImportWalletCubit>().accountInput,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration:
                                const InputDecoration(hintText: "Account"),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller:
                                context.read<ImportWalletCubit>().accountInput,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration:
                                const InputDecoration(hintText: "Change"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "🚨 Please don't provider any real wallet here! 🚨",
                      textAlign: TextAlign.center,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        context.read<ImportWalletCubit>().save().then((value) {
                          context.router.pop();
                        }).onError((error, stackTrace) {
                          final snackBar =
                              SnackBar(content: Text(error.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: const Text("Confirm"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
