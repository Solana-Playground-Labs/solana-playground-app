import 'package:solana_playground_language/solana_playground_language.dart';

import 'declare_variables_statement.dart';

class DeclareVariablesBuilder extends StatementBuilder {
  final List<DeclareVariableBuilder> _children;

  DeclareVariablesBuilder({required List<DeclareVariableBuilder> children}) : _children = children;

  factory DeclareVariablesBuilder.standard() {
    return DeclareVariablesBuilder(children: [DeclareVariableBuilder.standard()]);
  }

  List<DeclareVariableBuilder> get children => List.of(_children);

  void appendChild() {
    _children.add(DeclareVariableBuilder.standard());
    notifyListeners();
  }

  void removeChild(DeclareVariableBuilder child) {
    _children.remove(child);
    notifyListeners();
  }

  @override
  DeclareVariablesBuilder copy() {
    return DeclareVariablesBuilder(children: _children.map((e) => e.copy()).toList());
  }

  @override
  DeclareVariablesStatement get statement => DeclareVariablesStatement(children.map((e) => e.statement).toList());
}
