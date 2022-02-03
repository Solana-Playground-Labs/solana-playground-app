import 'package:flutter/widgets.dart';

abstract class StatementBuilder with ChangeNotifier {
  String get id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is StatementBuilder && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
