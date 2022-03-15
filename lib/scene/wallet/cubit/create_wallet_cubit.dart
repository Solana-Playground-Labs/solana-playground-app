/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';

part 'create_wallet_state.dart';

class CreateWalletCubit extends Cubit<CreateWalletState> {
  final WalletRepository repository;
  final nameInput = TextEditingController();
  final accountInput = TextEditingController(text: "0");
  final changeInput = TextEditingController(text: "0");

  CreateWalletCubit(this.repository)
      : super(
          CreateWalletState(
            mnemonic: repository.generateMnemomic(),
          ),
        );

  void generate() {
    emit(state.copyWith(mnemonic: repository.generateMnemomic()));
  }

  Future<void> save() async {
    if (nameInput.text.isEmpty) {
      throw Exception("Invalid name input");
    }
    await repository.importMnemonic(
      state.mnemonic,
      nameInput.text,
      account: int.tryParse(accountInput.text) ?? 0,
      change: int.tryParse(changeInput.text) ?? 0,
    );
  }

  @override
  Future<void> close() {
    nameInput.dispose();
    accountInput.dispose();
    changeInput.dispose();
    return super.close();
  }
}
