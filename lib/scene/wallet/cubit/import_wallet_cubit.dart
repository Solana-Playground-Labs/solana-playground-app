/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';

part 'import_wallet_state.dart';

class ImportWalletCubit extends Cubit<ImportWalletState> {
  final WalletRepository repository;
  final nameInput = TextEditingController();
  final mnemonicInput = TextEditingController();
  final accountInput = TextEditingController(text: "0");
  final changeInput = TextEditingController(text: "0");

  ImportWalletCubit(this.repository) : super(const ImportWalletState());

  @override
  Future<void> close() {
    nameInput.dispose();
    mnemonicInput.dispose();
    accountInput.dispose();
    changeInput.dispose();
    return super.close();
  }

  Future<void> save() async {
    repository.importMnemonic(
      mnemonicInput.text,
      nameInput.text,
      account: int.parse(accountInput.text),
      change: int.parse(changeInput.text),
    );
  }
}
