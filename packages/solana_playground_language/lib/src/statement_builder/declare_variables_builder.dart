import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:uuid/uuid.dart';

class DeclareVariablesBuilder extends StatementBuilder {
  @override
  final String id;

  final List<DeclareVariableBuilder> _children;

  List<DeclareVariableBuilder> get children => List.of(_children);

  DeclareVariablesStatement get statement => DeclareVariablesStatement(children.map((e) => e.statement).toList());

  DeclareVariablesBuilder({required List<DeclareVariableBuilder> children}) : id = const Uuid().v4(), _children = children;

  factory DeclareVariablesBuilder.standard() {
    return DeclareVariablesBuilder(children: [DeclareVariableBuilder.standard()]);
  }

  appendChild() {
    _children.add(DeclareVariableBuilder.standard());
    notifyListeners();
  }

  removeChild(DeclareVariableBuilder child) {
    _children.remove(child);
    notifyListeners();
  }
}
