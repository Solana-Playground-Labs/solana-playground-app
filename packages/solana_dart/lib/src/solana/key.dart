/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';

typedef PublicKey = Key;

abstract class Key extends Equatable {
  final String _value;

  const Key(this._value);

  @override
  List<Object> get props => [_value];
}
