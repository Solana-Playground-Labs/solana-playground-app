/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'console_io_state.dart';

class ConsoleIOCubit extends Cubit<ConsoleIOState> {
  final Stream ioStream;

  StreamSubscription? subscription;

  ConsoleIOCubit(this.ioStream) : super(const ConsoleIOState()) {
    subscription = ioStream.listen((event) {
      debugPrint("IO: ${event.toString()}");
      if (event is String) {
        emit(state.append(event));
      } else {
        emit(state.append(event.toString()));
      }
    });
  }

  @override
  close() async {
    await subscription?.cancel();
    await super.close();
  }
}
