import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/builder/command/unknown_command_builder.dart';

class UnknownCommand extends Command {
  final Map<String, dynamic> rawData;

  const UnknownCommand({
    required this.rawData,
  });

  @override
  List<Object> get props => [rawData];

  @override
  Map<String, dynamic> toJson() => rawData;

  @override
  CommandBuilder asBuilder() {
    return UnknownCommandBuilder(rawData: rawData);
  }
}
