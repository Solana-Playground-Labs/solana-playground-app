import 'package:dio/dio.dart' as network;
import 'package:solana_dart/src/request.dart';
import 'package:solana_dart/src/response.dart';
import 'package:solana_dart/src/results/vote_accounts_data.dart';

class SolanaApi {
  final network.Dio dio;

  SolanaApi(String endpoint) : dio = network.Dio(network.BaseOptions(baseUrl: endpoint));

  Future<Response<int>> getTransactionCount() async {
    final request = Request.v2(method: "getTransactionCount");
    var response = await dio.post('', data: request.toMap());
    return Response.fromMap(response.data);
  }

  Future<Response<VoteAccountsData>> getVoteAccount() async {
    final request = Request.v2(method: "getVoteAccounts");
    var response = await dio.post('', data: request.toMap());
    return Response.fromMapWithDecoder(response.data, VoteAccountsData.fromMap);
  }
}