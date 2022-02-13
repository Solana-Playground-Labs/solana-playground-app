import '../../type/type.dart';
import '../statement.dart';

class DeclareVariablesStatement extends BaseStatement {
  final List<DeclareVariableStatement> variables;

  const DeclareVariablesStatement(this.variables);

  @override
  InternalType get returnType => const InternalVoid();
}
