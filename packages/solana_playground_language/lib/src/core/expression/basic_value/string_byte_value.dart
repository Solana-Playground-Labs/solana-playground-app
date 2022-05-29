import 'package:solana_playground_language/solana_playground_language.dart';

part 'string_byte_value.builder.dart';

@ValueBuildable()
class StringByteValue extends Value {
  @ValuePropertyBuildable()
  final Expression expression;

  @ValuePropertyBuildable()
  final int base;

  const StringByteValue({
    required this.expression,
    required this.base,
  });

  @override
  List<Object> get props => [expression, base];

  factory StringByteValue.fromJson(Map<String, dynamic> json) =>
      _$StringByteValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StringByteValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$StringByteValueToBuilder(this);
}
