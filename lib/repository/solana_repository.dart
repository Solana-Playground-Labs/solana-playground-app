/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:dio/dio.dart';

class SolanaRepository {
  final String endpoint;
  final Dio dio;
  SolanaRepository(this.endpoint) : dio = Dio(BaseOptions(baseUrl: endpoint));

  Future<int> getTransactionCount() async {
    var response = await dio.post('',
        data: {"jsonrpc": "2.0", "id": 3, "method": "getTransactionCount"});

    return response.data['result'];
  }

  Future<int> getValidatorNodesCount() async {
    var response = await dio.post('',
        data: {"jsonrpc": "2.0", "id": 2, "method": "getVoteAccounts"});

    return response.data['result']['current'].length;
  }

  Future<double> getTransactionPerSecond() async {
    var response = await dio.post('', data: {
      "jsonrpc": "2.0",
      "id": 1,
      "method": "getRecentPerformanceSamples",
      "params": [10]
    });

    var sum = 0.0;
    for (var i = 0; i < response.data['result'].length; i++) {
      final sample = response.data['result'][i];
      final double tps = sample['numTransactions'] / sample['samplePeriodSecs'];
      sum = sum + tps;
    }
    return sum / response.data['result'].length;
  }
}
