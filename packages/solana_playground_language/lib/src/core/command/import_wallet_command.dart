import 'package:solana_playground_language/lib.dart';

class ImportWalletCommand extends Command {
  final Expression walletName;
  final String variable;

  const ImportWalletCommand({
    required this.walletName,
    required this.variable,
  });

  @override
  List<Object> get props => [walletName, variable];
}
