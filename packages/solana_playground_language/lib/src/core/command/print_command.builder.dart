// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_command.dart';

// **************************************************************************
// CommandBuilderGenerator
// **************************************************************************

class PrintCommandBuilder extends CommandBuilder {
  final ExpressionBuilder expression;

  PrintCommandBuilder({
    required this.expression,
  });

  @override
  PrintCommand build() {
    return PrintCommand(
      expression: expression.build(),
    );
  }

  @override
  PrintCommandBuilder clone() {
    return PrintCommandBuilder(
      expression: expression.clone(),
    );
  }
}

PrintCommand _$PrintCommandFromJson(Map<String, dynamic> json) {
  return PrintCommand(
    expression: Expression.fromJson(json['expression']),
  );
}

Map<String, dynamic> _$PrintCommandToJson(PrintCommand value) {
  return {
    'type': value.runtimeType.toString(),
    'expression': value.expression.toJson(),
  };
}

PrintCommandBuilder _$PrintCommandToBuilder(PrintCommand value) {
  return PrintCommandBuilder(expression: value.expression.asBuilder());
}
