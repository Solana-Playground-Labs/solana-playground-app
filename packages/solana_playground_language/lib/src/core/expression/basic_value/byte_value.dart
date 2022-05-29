import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language_generator/annotations.dart';

part 'byte_value.builder.dart';

@ValueBuildable()
class ByteValue extends Value {
  @ValuePropertyBuildable()
  final Expression expression;

  @ValuePropertyBuildable()
  final int length;

  const ByteValue({
    required this.expression,
    required this.length,
  });

  @override
  List<Object> get props => [expression, length];

  factory ByteValue.fromJson(Map<String, dynamic> json) =>
      _$ByteValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ByteValueToJson(this);

  @override
  ValueBuilder asBuilder() => _$ByteValueToBuilder(this);
}
