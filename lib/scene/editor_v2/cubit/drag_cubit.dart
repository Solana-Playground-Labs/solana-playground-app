/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drag_state.dart';

class DragCubit extends Cubit<DragState> {
  DragCubit() : super(const DragState());

  active() => emit(state.copyWith(isActive: true));

  deactive() => emit(state.copyWith(isActive: false));
}
