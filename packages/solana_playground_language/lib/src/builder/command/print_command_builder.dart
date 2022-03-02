import 'package:solana_playground_language/src/builder/core_builder.dart';
import 'package:solana_playground_language/src/core/command/command.dart';
import 'package:solana_playground_language/src/core/command/print_command.dart';
import 'package:solana_playground_language/src/core/expression/expression.dart';

class PrintCommandBuilder extends CommandBuilder {
  ExpressionBuilder expression;

  PrintCommandBuilder({required this.expression});

  @override
  PrintCommand build() {
    return PrintCommand(expression: expression.build());
  }

  @override
  CommandBuilder clone() {
    return PrintCommandBuilder(expression: expression);
  }
}
