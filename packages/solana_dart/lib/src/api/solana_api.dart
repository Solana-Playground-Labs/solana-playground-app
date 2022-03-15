/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:dio/dio.dart' as network;
import 'package:solana_dart/src/api/request.dart';
import 'package:solana_dart/src/api/response.dart';

import './models/models.dart';

class SolanaApi {
  final network.Dio dio;

  SolanaApi(String endpoint) : dio = network.Dio(network.BaseOptions(baseUrl: endpoint));

  Future<Response<int>> getTransactionCount() async {
    final request = Request.v2(method: "getTransactionCount");
    var response = await dio.post('', data: request.toMap());
    return Response.fromMap(response.data);
  }

  Future<Response<VoteAccounts>> getVoteAccount() async {
    final request = Request.v2(method: "getVoteAccounts");
    var response = await dio.post('', data: request.toMap());
    return Response.fromMapWithDecoder(response.data, VoteAccounts.fromMap);
  }

  Future<Response<List<PerfSample>>> getRecentPerformanceSamples() async {
    final request = Request.v2(method: "getRecentPerformanceSamples");
    var response = await dio.post('', data: request.toMap());
    return Response.fromMapWithDecoder(response.data, PerfSample.fromArray);
  }
}