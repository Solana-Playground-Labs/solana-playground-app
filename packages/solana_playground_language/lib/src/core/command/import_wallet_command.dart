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

  factory ImportWalletCommand.fromJson(Map<String, dynamic> json) {
    return ImportWalletCommand(
      variable: json['variable'],
      walletName: Expression.fromJson(json['walletName']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
      'walletName': walletName.toJson(),
    };
  }

  @override
  ImportWalletCommandBuilder asBuilder() {
    return ImportWalletCommandBuilder(
      walletName: walletName.asBuilder(),
      variable: variable,
    );
  }
}
