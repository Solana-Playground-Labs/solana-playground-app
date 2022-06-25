/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/builder/command/block_command_builder.dart';
import 'package:solana_playground_language/src/core/command/block_command.dart';

class Script extends Equatable {
  final String name;
  final BlockCommand blockCommand;
  final Map<String, dynamic> arguments;

  const Script({
    required this.name,
    required this.blockCommand,
    required this.arguments,
  });

  factory Script.main() {
    return const Script(
      name: 'main',
      blockCommand: BlockCommand(commands: []),
      arguments: {},
    );
  }

  @override
  List<Object> get props => [name, blockCommand, arguments];

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      name: json['name'],
      blockCommand: BlockCommand.fromJson(json['blockCommand']),
      arguments: const {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': runtimeType.toString(),
      'name': name,
      'blockCommand': blockCommand.toJson(),
    };
  }

  ScriptBuilder asBuilder() {
    return ScriptBuilder(
      name: name,
      blockCommandBuilder: blockCommand.asBuilder(),
    );
  }
}

class ScriptBuilder extends Builder {
  String _name;
  BlockCommandBuilder _blockCommandBuilder;

  ScriptBuilder({required String name, required BlockCommandBuilder blockCommandBuilder})
      : _name = name,
        _blockCommandBuilder = blockCommandBuilder;

  @override
  ScriptBuilder clone() {
    return ScriptBuilder(name: name, blockCommandBuilder: blockCommandBuilder);
  }

  BlockCommandBuilder get blockCommandBuilder => _blockCommandBuilder;

  set blockCommandBuilder(BlockCommandBuilder value) {
    _blockCommandBuilder = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  Script build() {
    return Script(
      name: _name,
      blockCommand: _blockCommandBuilder.build(),
      arguments: const {},
    );
  }
}
