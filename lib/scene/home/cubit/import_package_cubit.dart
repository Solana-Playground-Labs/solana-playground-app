// Solana Playground
// Copyright (C) 2022 Tran Giang Long
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'import_package_state.dart';

class ImportPackageCubit extends Cubit<ImportPackageState> {
  final input = TextEditingController();
  final PackageRepository repository;

  ImportPackageCubit(this.repository) : super(const ImportPackageState());

  @override
  close() async {
    input.dispose();
    await super.close();
  }

  Future<void> import() async {
    if (state.isProcessing) return;
    try {
      emit(state.copyWith(isProcessing: true));

      final json = const JsonDecoder().convert(input.text);
      final package = Package.fromJson(json);
      repository.addPackage(package);

    } on Exception catch (e) {
      emit(state.copyWith(exception: e));
    } finally {
      emit(state.copyWith(isProcessing: false));
    }
  }
}
