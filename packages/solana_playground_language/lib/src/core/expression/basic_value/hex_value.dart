import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'hex_value.builder.dart';

@ValueBuildable()
class HexValue extends Value {
  @ValuePropertyBuildable()
  final Expression expression;

  const HexValue({
    required this.expression,
  });

  @override
  List<Object> get props => [expression];

  factory HexValue.fromJson(Map<String, dynamic> json) =>
      _$HexValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HexValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$HexValueToBuilder(this);
}
