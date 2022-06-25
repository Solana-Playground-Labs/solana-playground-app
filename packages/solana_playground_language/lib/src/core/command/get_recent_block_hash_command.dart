/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

class GetRecentBlockHashCommand extends Command {
  final String variable;

  const GetRecentBlockHashCommand({required this.variable});

  @override
  List<Object?> get props => [variable];

  factory GetRecentBlockHashCommand.fromJson(Map<String, dynamic> json) {
    return GetRecentBlockHashCommand(
      variable: json['variable'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
    };
  }

  @override
  GetRecentBlockHashCommandBuilder asBuilder() {
    return GetRecentBlockHashCommandBuilder(variable: variable);
  }
}
