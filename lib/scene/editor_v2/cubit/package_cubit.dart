/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'package_state.dart';

class PackageNameCubit extends Cubit<PackageNameState> {
  final PackageBuilder builder;
  final TextEditingController textEditorController = TextEditingController();

  PackageNameCubit(this.builder) : super(PackageNameState(name: builder.name)) {
    builder.addListener(listener);

    textEditorController.text = builder.name;
    textEditorController.addListener(() {
      builder.name = textEditorController.text;
    });
  }

  void listener() {
    emit(state.copyWith(name: builder.name));
    if (builder.name != textEditorController.text) {
      textEditorController.text = builder.name;
    }
  }

  @override
  Future<void> close() async {
    textEditorController.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}
