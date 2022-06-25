/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/solana_network_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/scene/editor_v2/widget/console_io_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class RuntimeView extends CubitWidget<RuntimeCubit, RuntimeState> {
  final Package package;
  final bool autoRun;

  const RuntimeView({
    Key? key,
    required this.package,
    this.autoRun = true,
  }) : super(key: key);

  @override
  Widget content(BuildContext context, RuntimeState state) {
    return WillPopScope(
      onWillPop: () async {
        return state.status == RuntimeStatus.idle;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: const Text("Runtime"),
          actions: [
            state.status == RuntimeStatus.idle
                ? IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(Icons.close),
                  )
                : const Center(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
          ],
        ),
        body: const ConsoleIOWidget(),
      ),
    );
  }

  @override
  RuntimeCubit cubit(BuildContext context) {
    final runtimeCubit = RuntimeCubit(
      package,
      context.read(),
      context.read<SolanaNetworkCubit>().state.selected,
    );

    if (autoRun) runtimeCubit.start();

    return runtimeCubit;
  }
}
