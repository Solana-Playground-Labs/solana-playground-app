/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'runtime_cubit.dart';

enum RuntimeStatus {
  idle,
  compiling,
  running,
}

class RuntimeState extends Equatable {
  final Package? package;
  final RuntimeStatus status;
  final String? compilingError;
  final SPRuntime? runtime;
  final dynamic result;

  const RuntimeState({
    this.package,
    this.compilingError,
    required this.status,
    required this.result,
    this.runtime,
  });

  @override
  List<Object?> get props => [compilingError, package, status, result, runtime];

  RuntimeState copyWith({
    Package? package,
    RuntimeStatus? status,
    String? compilingError,
    SPRuntime? runtime,
    dynamic result,
  }) {
    return RuntimeState(
      package: package ?? this.package,
      status: status ?? this.status,
      compilingError: compilingError ?? this.compilingError,
      runtime: runtime ?? this.runtime,
      result: result ?? this.result,
    );
  }
}
