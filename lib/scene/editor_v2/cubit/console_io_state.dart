/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'console_io_cubit.dart';

class Output extends Equatable {
  final DateTime timestamp;
  final String data;

  const Output({
    required this.timestamp,
    required this.data,
  });

  @override
  List<Object> get props => [timestamp, data];
}

class ConsoleIOState extends Equatable {
  final List<Output> histories;

  const ConsoleIOState({this.histories = const []});

  ConsoleIOState append(String data) {
    return copyWith(histories: [
      ...histories,
      Output(timestamp: DateTime.now(), data: data)
    ]);
  }

  @override
  List<Object> get props => [histories];

  ConsoleIOState copyWith({
    List<Output>? histories,
  }) {
    return ConsoleIOState(
      histories: histories ?? this.histories,
    );
  }
}
