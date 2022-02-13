import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/utils/list_extension.dart';

class PrintBuilder extends StatementBuilder {
  final List<ValueRootBuilder> _valueRootBuilders;

  PrintBuilder(List<ValueRootBuilder> valueRootBuilders) : _valueRootBuilders = valueRootBuilders;

  List<ValueRootBuilder> get valueRootBuilders => List.of(_valueRootBuilders);

  factory PrintBuilder.standard() => PrintBuilder([ValueRootBuilder.variable()]);

  void add(ValueRootBuilder valueBuilder) {
    _valueRootBuilders.add(valueBuilder);
    notifyListeners();
  }

  void remove(ValueRootBuilder valueBuilder) {
    _valueRootBuilders.remove(valueBuilder);
    notifyListeners();
  }

  void moveTo(ValueRootBuilder valueRootBuilder, int index) {
    if (_valueRootBuilders.moveTo(valueRootBuilder, index)) notifyListeners();
  }

  @override
  PrintBuilder copy() {
    return PrintBuilder(_valueRootBuilders.map((e) => e.copy()).toList());
  }

  @override
  PrintStatement get statement => PrintStatement(variables: _valueRootBuilders.map((e) => e.valueBuilder.value).toList());


}
