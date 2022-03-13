import 'package:solana_playground_language/src/core/command/import_wallet_command.dart';

import '../../../solana_playground_language.dart';

class ImportWalletCommandBuilder extends CommandBuilder {
  ExpressionBuilder _walletName;
  String _variable;

  ImportWalletCommandBuilder({
    required ExpressionBuilder walletName,
    required String variable,
  })  : _walletName = walletName,
        _variable = variable;

  ExpressionBuilder get walletName => _walletName;

  String get variable => _variable;

  set variable(String variable) {
    _variable = variable;
    notifyListeners();
  }

  set walletName(ExpressionBuilder walletName) {
    _walletName = walletName;
    notifyListeners();
  }

  @override
  Command build() {
    return ImportWalletCommand(
      walletName: walletName.build(),
      variable: variable,
    );
  }

  @override
  CommandBuilder clone() {
    return ImportWalletCommandBuilder(
      walletName: walletName.clone(),
      variable: variable,
    );
  }

  factory ImportWalletCommandBuilder.empty() {
    return ImportWalletCommandBuilder(
      walletName: ExpressionBuilder.withConstantValue(),
      variable: "",
    );
  }
}
