part of 'runtime_cubit.dart';

enum RuntimeStatus {
  idle,
  compiling,
  running,
}

class RuntimeState extends Equatable {
  final Package? package;
  final RuntimeStatus status;
  final dynamic result;

  const RuntimeState({
    this.package,
    required this.status,
    required this.result,
  });

  @override
  List<Object?> get props => [package, status, result];

  RuntimeState copyWith({
    Package? package,
    RuntimeStatus? status,
    dynamic result,
  }) {
    return RuntimeState(
      package: package ?? this.package,
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }
}
