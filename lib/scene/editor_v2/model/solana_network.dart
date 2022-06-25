/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana/solana.dart';

class SolanaNetwork extends Equatable {
  final String name;
  final String rpcURL;
  final String socketURL;

  const SolanaNetwork({
    required this.name,
    required this.rpcURL,
    required this.socketURL,
  });

  @override
  List<Object> get props => [name, rpcURL, socketURL];

  SolanaNetwork copyWith({
    String? name,
    String? rpcURL,
    String? socketURL,
  }) {
    return SolanaNetwork(
      name: name ?? this.name,
      rpcURL: rpcURL ?? this.rpcURL,
      socketURL: socketURL ?? this.socketURL,
    );
  }
}

extension SolanaNetworkHelper on SolanaNetwork {
  SolanaClient asClient() => SolanaClient(
        rpcUrl: Uri.parse(rpcURL),
        websocketUrl: Uri.parse(socketURL),
      );
}
