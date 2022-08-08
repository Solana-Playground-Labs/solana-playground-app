/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/solana_network_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/model/solana_network.dart';

class NetworkRawLabel extends StatelessWidget {
  const NetworkRawLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolanaNetworkCubit, SolanaNetworkState>(
        builder: (context, state) {
          return Text(
            state.selected.name,
            style: const TextStyle(color: Colors.blue),
          );
        }
    );
  }
}


class NetworkLabel extends StatelessWidget {
  const NetworkLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolanaNetworkCubit, SolanaNetworkState>(
      builder: (context, state) {
        return PopupMenuButton<SolanaNetwork>(
          itemBuilder: (context) => state.networks
              .map(
                (e) => PopupMenuItem<SolanaNetwork>(
                  child: Text(e.name),
                  onTap: () {
                    context.read<SolanaNetworkCubit>().select(e);
                  },
                ),
              )
              .toList(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            state.selected.name,
            style: const TextStyle(color: Colors.blue),
          ),
        );
      },
    );
  }
}
