/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'sp_keypair_security_memory.dart';

class SPMemory {
  final Map<String, dynamic> _data = {};
  final SPKeypairSecurityMemory keypairStorage = SPKeypairSecurityMemory();

  dynamic read(String variable) {
    return _data[variable];
  }

  void write(String variable, dynamic value) {
    _data[variable] = value;
  }
}
