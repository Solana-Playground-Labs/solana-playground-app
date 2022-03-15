import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/command_builder.dart';

import 'abstract_command.dart';

class RequestRecentBlockhash extends Command {
  final String variable;

  const RequestRecentBlockhash({required this.variable});

  @override
  List<Object> get props => [variable];

  factory RequestRecentBlockhash.fromJson(Map<String, dynamic> json) {
    return RequestRecentBlockhash(variable: json['variable']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
    };
  }

  @override
  RequestRecentBlockhashBuilder asBuilder() {
    return RequestRecentBlockhashBuilder(variable: variable);
  }
}
