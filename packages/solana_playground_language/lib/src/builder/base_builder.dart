import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

abstract class BaseBuilder with ChangeNotifier {
  final String id;

  BaseBuilder() : id = const Uuid().v4();

  @override
  bool operator ==(Object other) => identical(this, other) || other is BaseBuilder && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
