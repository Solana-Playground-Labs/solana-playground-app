/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/home/cubit/keypairs_cubit.dart';

class KeypairsListView extends CubitWidget<KeypairsCubit, WalletsState> {
  const KeypairsListView({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, WalletsState state) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keypairs storage")),
      body: BlocBuilder<KeypairsCubit, WalletsState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final keypair = state.keypairs[index];
              return Container(
                color: Colors.white,
                child: Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    title: Text(keypair.name),
                    subtitle: Text(keypair.publicKeyBase58),
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: keypair.name));
                        context.router.pop();
                      },
                    ),
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: keypair.publicKeyBase58),
                      );
                      context.router.pop();
                    },
                  ),
                ),
              );
            },
            itemCount: state.keypairs.length,
          );
        },
      ),
    );
  }

  KeypairsCubit cubit(BuildContext context) => KeypairsCubit(context.read());
}
