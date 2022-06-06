/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'drag_cubit.dart';

class DragState extends Equatable {
  final bool isActive;

  const DragState({this.isActive = false});

  @override
  List<Object> get props => [isActive];

  DragState copyWith({bool? isActive}) {
    return DragState(isActive: isActive ?? this.isActive);
  }
}
