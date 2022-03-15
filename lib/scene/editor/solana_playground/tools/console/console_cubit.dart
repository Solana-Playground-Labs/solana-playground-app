/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/scene/editor/cubit/cubit.dart';

part 'console_state.dart';

class ConsoleCubit extends Cubit<ConsoleState> {
  final RuntimeCubit runtimeCubit;
  StreamSubscription? _subscription;

  ConsoleCubit(this.runtimeCubit) : super(const ConsoleState()) {
    _subscription = runtimeCubit.console.stream.listen((event) {
      final line = event is String ? event : event.toString();
      emit(state.addLine(line));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
