import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/base_builder.dart';
import 'package:solana_playground_language/src/extensions/extensions.dart';

abstract class StatementBuilder extends BaseBuilder {
  StatementBuilder(): super();

  @override
  StatementBuilder copy();

  BaseStatement get statement;
}

class StatementMultipleBuilder<T extends StatementBuilder> extends StatementBuilder {
  final List<T> _builders;

  StatementMultipleBuilder(List<T> builders) : _builders = builders;

  List<T> get builders => List.of(builders);

  void add(T valueBuilder) {
    _builders.add(valueBuilder);
    notifyListeners();
  }

  void remove(T valueBuilder) {
    _builders.remove(valueBuilder);
    notifyListeners();
  }

  void moveTo(T valueRootBuilder, int index) {
    if (_builders.moveTo(valueRootBuilder, index)) notifyListeners();
  }

  @override
  StatementMultipleBuilder<T> copy() {
    return StatementMultipleBuilder<T>(_builders.map((e) => e.copy() as T).toList());
  }

  @override
  PrintStatement get statement =>
      PrintStatement(variables: _builders.map((e) => e.valueBuilder.value).toList());
}