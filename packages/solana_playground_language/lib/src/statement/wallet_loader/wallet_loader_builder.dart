import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/statement/wallet_loader/wallet_loader_statement.dart';
import 'package:solana_playground_language/src/types.dart';

class WalletLoaderBuilderBuilder extends StatementBuilder {
  Variable _privateKeyVariable;
  Variable _publicKeyVariable;
  String _description;

  WalletLoaderBuilderBuilder({
    required Variable privateKeyVariable,
    required Variable publicKeyVariable,
    required String description,
  })  : _privateKeyVariable = privateKeyVariable,
        _publicKeyVariable = publicKeyVariable,
        _description = description;

  Variable get privateKeyVariable => _privateKeyVariable;

  set privateKeyVariable(Variable value) {
    _privateKeyVariable = value;
    notifyListeners();
  }

  Variable get publicKeyVariable => _publicKeyVariable;

  set publicKeyVariable(Variable value) {
    _publicKeyVariable = value;
    notifyListeners();
  }

  String get description => _description;

  set description(String value) {
    _description = value;
    notifyListeners();
  }

  @override
  WalletLoaderStatement get statement => throw WalletLoaderStatement(
        privateKeyVariable: privateKeyVariable,
        publicKeyVariable: publicKeyVariable,
        description: description,
      );

  @override
  StatementBuilder copy() {
    return WalletLoaderBuilderBuilder(
      privateKeyVariable: _privateKeyVariable,
      publicKeyVariable: _publicKeyVariable,
      description: _description,
    );
  }
}
