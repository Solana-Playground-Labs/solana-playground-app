import 'value.dart';

class VariableValue extends Value {
  final String variable;

  const VariableValue({required this.variable});

  @override
  List<Object> get props => [variable];
}
