/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solana_playground_language/lib.dart';

class IconCubit extends Cubit<SPIcon> {
  final shortNameInput = TextEditingController();

  IconCubit(SPIcon initIcon) : super(initIcon) {
    shortNameInput.text = initIcon.shortName;

    shortNameInput.addListener(() {
      emit(state.copyWith(shortName: shortNameInput.text));
    });
  }

  updateBackground(Color color) {
    emit(state.copyWith(backgroundColor: color.value));
  }

  updateForeground(Color color) {
    emit(state.copyWith(foregroundColor: color.value));
  }

  @override
  close() async {
    shortNameInput.dispose();
    super.close();
  }
}
