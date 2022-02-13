import 'package:solana_playground_language/extensions/list_extension.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class PrintBuilder extends StatementBuilder {
  final List<ValueContainerBuilder> _valueRootBuilders;

  PrintBuilder(List<ValueContainerBuilder> valueRootBuilders) : _valueRootBuilders = valueRootBuilders;

  List<ValueContainerBuilder> get valueRootBuilders => List.of(_valueRootBuilders);

  factory PrintBuilder.standard() => PrintBuilder([ValueContainerBuilder.variable()]);

  void add(ValueContainerBuilder valueBuilder) {
    _valueRootBuilders.add(valueBuilder);
    notifyListeners();
  }

  void remove(ValueContainerBuilder valueBuilder) {
    _valueRootBuilders.remove(valueBuilder);
    notifyListeners();
  }

  void moveTo(ValueContainerBuilder valueRootBuilder, int index) {
    if (_valueRootBuilders.moveTo(valueRootBuilder, index)) notifyListeners();
  }

  @override
  PrintBuilder copy() {
    return PrintBuilder(_valueRootBuilders.map((e) => e.copy()).toList());
  }

  @override
  PrintStatement get statement =>
      PrintStatement(variables: _valueRootBuilders.map((e) => e.valueBuilder.value).toList());
}
