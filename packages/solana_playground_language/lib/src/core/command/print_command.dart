/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'print_command.builder.dart';

@CommandBuildable()
class PrintCommand extends Command {
  @CommandPropertyBuildable()
  final Expression expression;

  const PrintCommand({required this.expression});

  @override
  List<Object> get props => [expression];

  factory PrintCommand.fromJson(Map<String, dynamic> json) =>
      _$PrintCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PrintCommandToJson(this);

  @override
  PrintCommandBuilder asBuilder() => _$PrintCommandToBuilder(this);
}
