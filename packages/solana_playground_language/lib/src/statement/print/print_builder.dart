import 'package:solana_playground_language/solana_playground_language.dart';

class PrintBuilder extends StatementBuilder {
  final ListBaseBuilder<ValueContainerBuilder> _valueRootBuilders;

  PrintBuilder(List<ValueContainerBuilder> valueRootBuilders) : _valueRootBuilders = ListBaseBuilder(valueRootBuilders);

  factory PrintBuilder.standard() => PrintBuilder([ValueContainerBuilder.variable()]);

  ListBaseBuilder<ValueContainerBuilder> get variables => _valueRootBuilders;

  @override
  PrintBuilder copy() {
    return PrintBuilder(_valueRootBuilders.builders.map((e) => e.copy()).toList());
  }

  @override
  PrintStatement get statement =>
      PrintStatement(variables: _valueRootBuilders.builders.map((e) => e.valueBuilder.value).toList());
}
