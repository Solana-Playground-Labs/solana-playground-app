import 'package:flutter_test/flutter_test.dart';

import 'package:solana_dart/solana_dart.dart';
import 'package:solana_dart/src/results/perf_samples.dart';
import 'package:solana_dart/src/results/vote_accounts.dart';
import 'package:solana_dart/src/solana_api.dart';

void main() {
  test('getTransactionCount', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getTransactionCount();
    expect(response.result, isInstanceOf<int>());
  });

  test('getPerfSamples', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getRecentPerformanceSamples();
    expect(response.result, isInstanceOf<List<PerfSamples>>());
  });

  test('getVoteAccount', () async {
    SolanaApi api = SolanaApi('https://api.devnet.solana.com');
    final response = await api.getVoteAccount();
    expect(response.result, isInstanceOf<VoteAccounts>());
  });
}
