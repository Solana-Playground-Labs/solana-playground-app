/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_app/repository/keypair_repository.dart';
import 'package:solana_playground_app/scene/editor_v2/model/solana_network.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/solana_playground_runtime.dart';

part 'runtime_state.dart';

class RuntimeCubit extends Cubit<RuntimeState> {
  final Package package;
  final StreamController<dynamic> console = StreamController.broadcast();
  final KeypairRepository keypairRepository;
  final SolanaNetwork network;

  CancelableOperation? _execution;

  RuntimeCubit(this.package, this.keypairRepository, this.network)
      : super(const RuntimeState(
          status: RuntimeStatus.idle,
          result: null,
        ));

  Future<dynamic> start() async {
    if (state.status == RuntimeStatus.running) {
      return;
    }

    await state.runtime?.dispose();

    _execution = CancelableOperation.fromFuture(execute());
  }

  Future<void> stop() async {
    await _execution?.cancel();
  }

  Future<dynamic> execute() async {
    try {
      SPRuntime runtime = SPRuntime(
        keypairProvider: SPKeypairProvider(
          keypairs: Map.fromEntries(
            keypairRepository.data.map(
              (e) => MapEntry(
                e.name,
                Keypair(publicKey: e.publicKey, privateKey: e.privateKey),
              ),
            ),
          ),
        ),
        solanaClient: SolanaClient(
          rpcUrl: Uri.parse(network.rpcURL),
          websocketUrl: Uri.parse(network.socketURL),
        ),
      );
      runtime.console.streamController.stream.listen((event) {
        console.add(event);
      });

      emit(state.copyWith(runtime: runtime, status: RuntimeStatus.running));
      final result = await runtime.run(package);
      emit(state.copyWith(result: result));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(status: RuntimeStatus.idle));
    }
  }

  @override
  Future<void> close() {
    console.close();
    return super.close();
  }
}
