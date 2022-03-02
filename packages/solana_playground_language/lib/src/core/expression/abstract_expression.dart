import 'package:equatable/equatable.dart';

import 'value.dart';

class Expression extends Equatable {
  final Value value;

  const Expression({required this.value});

  @override
  List<Object?> get props => [value];
}
