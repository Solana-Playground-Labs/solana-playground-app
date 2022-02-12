import 'package:equatable/equatable.dart';

class Response<T extends Object> extends Equatable {
  final int id;
  final String jsonrpc;
  final T result;

  const Response({required this.id, required this.jsonrpc, required this.result});

  @override
  List<Object> get props {
    return [id, jsonrpc, result];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'jsonrpc': this.jsonrpc,
      'result': this.result,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      id: map['id'] as int,
      jsonrpc: map['jsonrpc'] as String,
      result: map['result'] as T,
    );
  }
}

abstract class Result extends Equatable {}
