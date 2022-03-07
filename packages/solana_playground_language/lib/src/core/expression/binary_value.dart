import 'dart:typed_data';

import 'package:solana_playground_language/solana_playground_language.dart';

class BinaryValue extends Value {
  final Uint8List data;

  const BinaryValue({required this.data});

  @override
  List<Object> get props => [data];
}
