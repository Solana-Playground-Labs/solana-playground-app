import 'value.dart';

class VariableValue extends Value {
  final String variable;

  const VariableValue({required this.variable});

  @override
  List<Object> get props => [variable];

  factory VariableValue.fromJson(Map<String, dynamic> json) {
    return VariableValue(variable: json['variable']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': classType,
      'variable': variable,
    };
  }
}
