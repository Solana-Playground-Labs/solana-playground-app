import 'package:solana_playground_language/lib.dart';

class UnknownCommand extends Command {
  final Map<String, dynamic> rawData;

  const UnknownCommand({
    required this.rawData,
  });

  @override
  List<Object> get props => [rawData];

  @override
  Map<String, dynamic> toJson() => rawData;
}
