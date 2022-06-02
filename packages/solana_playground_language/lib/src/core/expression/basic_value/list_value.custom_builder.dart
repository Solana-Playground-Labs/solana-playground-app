/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'list_value.dart';

class ListValueBuilder extends ValueBuilder with ListMixin<ExpressionBuilder> {
  List<ExpressionBuilder> _expressions;

  ListValueBuilder({
    required List<ExpressionBuilder> expressions,
  }) : _expressions = expressions;

  @override
  String get name => "List";

  List<ExpressionBuilder> get expressions => _expressions;

  set expressions(List<ExpressionBuilder> value) {
    _expressions = value;
    notifyListeners();
  }

  @override
  int get length => _expressions.length;

  @override
  set length(int newLength) {
    _expressions.length = newLength;
  }

  @override
  void insert(int index, ExpressionBuilder element) {
    _expressions.insert(index, element);
    notifyListeners();
  }

  @override
  void add(ExpressionBuilder element) {
    _expressions.add(element);
    notifyListeners();
  }

  @override
  bool remove(Object? element) {
    final r = _expressions.remove(element);
    notifyListeners();
    return r;
  }

  void moveTo(Object object, int index) {
    _expressions.moveTo(object, index);
    notifyListeners();
  }

  @override
  ExpressionBuilder operator [](int index) => _expressions[index];

  @override
  void operator []=(int index, ExpressionBuilder value) {
    _expressions[index] = value;
    notifyListeners();
  }

  @override
  Value build() {
    return ListValue(expressions: _expressions.map((e) => e.build()).toList());
  }

  @override
  ValueBuilder clone() {
    return ListValueBuilder(
        expressions: _expressions.map((e) => e.clone()).toList());
  }
}
