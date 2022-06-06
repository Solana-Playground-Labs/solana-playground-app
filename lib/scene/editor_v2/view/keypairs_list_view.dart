/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/home/cubit/wallets_cubit.dart';

class KeypairsListView extends CubitWidget<WalletsCubit, WalletsState> {
  const KeypairsListView({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, WalletsState state) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keypairs storage")),
      body: BlocBuilder<WalletsCubit, WalletsState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final keypair = state.wallets[index];
              return Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(keypair.name),
                  subtitle: FutureBuilder(
                    future: keypair.address,
                    builder: (context, snapshot) => Text(
                      snapshot.data.toString(),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: keypair.name));
                      context.router.pop();
                    },
                  ),
                ),
              );
            },
            itemCount: state.wallets.length,
          );
        },
      ),
    );
  }

  WalletsCubit cubit(BuildContext context) => WalletsCubit(context.read());
}
