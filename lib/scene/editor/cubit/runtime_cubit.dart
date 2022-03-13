import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/solana_playground_runtime.dart';

part 'runtime_state.dart';

class RuntimeCubit extends Cubit<RuntimeState> {
  final SPPackageBuilder packageBuilder;
  final StreamController<dynamic> console = StreamController.broadcast();
  final WalletRepository walletRepository;

  RuntimeCubit(this.packageBuilder, this.walletRepository)
      : super(const RuntimeState(
          status: RuntimeStatus.idle,
          result: null,
        ));

  Future<void> build() async {
    if (state.status != RuntimeStatus.idle) return;
    try {
      emit(state.copyWith(status: RuntimeStatus.compiling));
      final package = packageBuilder.build();
      emit(state.copyWith(package: package));
    } catch (e) {
      emit(state.copyWith(compilingError: e.toString()));
    } finally {
      emit(state.copyWith(status: RuntimeStatus.idle));
    }
  }

  Future<dynamic> run() async {
    await build();

    if (state.package == null) {
      throw Exception("Can not find build");
    }

    await state.runtime?.dispose();

    try {

      final wallets = await Future.wait(
        walletRepository.data.map(
          (wallet) async => MapEntry(
            wallet.name,
            await wallet.extractKeypair(),
          ),
        ),
      );

      SPRuntime runtime = SPRuntime(
        walletProvider: SPWalletProvider(
          wallets: Map.fromEntries(wallets),
        ),
      );
      runtime.console.streamController.stream.listen((event) {
        console.add(event);
      });

      emit(state.copyWith(runtime: runtime, status: RuntimeStatus.running));
      final result = await runtime.run(state.package!);
      emit(state.copyWith(result: result));
    } on Exception catch (e) {
      console.add("Runtime error: '$e'");
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
