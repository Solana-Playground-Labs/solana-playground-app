/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_language/lib.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackageRepository repository;
  StreamSubscription? streamSubscription;

  PackagesCubit(this.repository)
      : super(PackagesState(packages: repository.packages)) {
    streamSubscription = repository.onChange.listen((event) {
      emit(state.copyWith(packages: List.of(event)));
    });
  }

  @override
  Future<void> close() async {
    await streamSubscription?.cancel();
    return super.close();
  }
}
