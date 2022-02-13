import 'package:flutter_test/flutter_test.dart';
import 'package:solana_dart/src/api/models/models.dart';

import 'package:solana_dart/src/api/solana_api.dart';

void main() {
  test('getTransactionCount', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getTransactionCount();
    expect(response.result, isInstanceOf<int>());
  });

  test('getPerfSamples', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getRecentPerformanceSamples();
    expect(response.result, isInstanceOf<List<PerfSample>>());
  });

  test('getVoteAccount', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getVoteAccount();
    expect(response.result, isInstanceOf<VoteAccounts>());
  });
}
