import 'package:solana_playground_language/lib.dart';

class GetRecentBlockHashCommand extends Command {
  final String variable;

  const GetRecentBlockHashCommand({required this.variable});

  @override
  List<Object?> get props => [variable];
}