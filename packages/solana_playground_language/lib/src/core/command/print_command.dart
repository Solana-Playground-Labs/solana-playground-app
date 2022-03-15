import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/command_builder.dart';
import 'package:solana_playground_language/src/core/command/abstract_command.dart';
import 'package:solana_playground_language/src/core/expression/abstract_expression.dart';

class PrintCommand extends Command {
  final Expression expression;

  const PrintCommand({required this.expression});

  @override
  List<Object> get props => [expression];

  factory PrintCommand.fromJson(Map<String, dynamic> json) {
    return PrintCommand(
      expression: Expression.fromJson(json['expression']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'expression': expression.toJson(),
    };
  }

  @override
  PrintCommandBuilder asBuilder() {
    return PrintCommandBuilder(expression: expression.asBuilder());
  }
}
