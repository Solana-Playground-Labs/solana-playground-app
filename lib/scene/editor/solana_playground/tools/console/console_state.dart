/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'console_cubit.dart';

class ConsoleState extends Equatable {
  final List<String> lines;

  const ConsoleState({this.lines = const []});

  ConsoleState addLine(String line) {
    final _lines = List.of(lines);
    _lines.add(line);
    while (_lines.length > 100) {
      _lines.removeAt(0);
    }
    return ConsoleState(lines: _lines);
  }

  @override
  List<Object> get props => [lines];
}
