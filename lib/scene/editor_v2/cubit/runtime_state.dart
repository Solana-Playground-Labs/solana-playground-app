/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'runtime_cubit.dart';

enum RuntimeStatus {
  idle,
  running,
}

class RuntimeState extends Equatable {
  final RuntimeStatus status;
  final SPRuntime? runtime;
  final dynamic result;

  const RuntimeState({
    required this.status,
    required this.result,
    this.runtime,
  });

  @override
  List<Object?> get props => [status, result, runtime];

  RuntimeState copyWith({
    Package? package,
    RuntimeStatus? status,
    String? compilingError,
    SPRuntime? runtime,
    dynamic result,
  }) {
    return RuntimeState(
      status: status ?? this.status,
      runtime: runtime ?? this.runtime,
      result: result ?? this.result,
    );
  }
}
