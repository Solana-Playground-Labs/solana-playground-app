import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'dart:collection';

export 'command/command_builder.dart';
export 'expression/expression_builder.dart';

const _uuid = Uuid();

abstract class Unique {
  final String id;

  Unique() : id = _uuid.v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Unique && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

abstract class Builder extends Unique with ChangeNotifier {
  Builder clone();
}

class ListBuilder<T> extends ListBase<T> with ChangeNotifier {
  final List<T> _data;

  ListBuilder(this._data);

  factory ListBuilder.empty() => ListBuilder<T>([]);

  @override
  void insert(int index, T element) {
    super.insert(index, element);
    notifyListeners();
  }

  @override
  void add(T element) {
    super.add(element);
    notifyListeners();
  }

  @override
  bool remove(Object? element) {
    final r = super.remove(element);
    notifyListeners();
    return r;
  }

  @override
  T operator [](int index) {
    return _data[index];
  }

  @override
  void operator []=(int index, T value) {
    _data[index] = value;
  }

  @override
  int get length => _data.length;

  @override
  set length(int newLength) {
    _data.length = length;
  }
}

// class ListBuilder<T extends Builder> extends ChangeNotifier {
//   List<T> _data;
//
//   ListBuilder(this._data);
//
//   List<T> get data => _data;
//
//   set data(List<T> value) {
//     _data = value;
//     notifyListeners();
//   }
//
//   void insert(int index, T element) {
//     _data.insert(index, element);
//     notifyListeners();
//   }
//
//   void add(T element) {
//     _data.add(element);
//     notifyListeners();
//   }
//
//   void remove(T element) {
//     _data.remove(element);
//     notifyListeners();
//   }
// }