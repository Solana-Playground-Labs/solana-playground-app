import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

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

class ListBuilder<T extends Builder> extends ChangeNotifier {
  final List<T> data;

  ListBuilder(this.data);
}