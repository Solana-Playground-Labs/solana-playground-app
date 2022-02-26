import 'package:flutter/foundation.dart';
import 'package:solana_playground_language/src/extensions/extensions.dart';
import 'package:uuid/uuid.dart';

abstract class BaseBuilder with ChangeNotifier {
  final String id;

  BaseBuilder() : id = const Uuid().v4();

  BaseBuilder copy();

  @override
  bool operator ==(Object other) => identical(this, other) || other is BaseBuilder && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class ListBaseBuilder<T extends BaseBuilder> extends BaseBuilder {
  final List<T> _builders;

  ListBaseBuilder(List<T> builders) : _builders = builders;

  List<T> get builders => List.of(_builders);

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
  ListBaseBuilder<T> copy() {
    return ListBaseBuilder<T>(_builders.map((e) => e.copy() as T).toList());
  }
}
