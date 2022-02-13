import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final int id;
  final String jsonrpc;
  final String method;
  final List? params;

  const Request({required this.id, required this.jsonrpc, required this.method, required this.params});

  factory Request.v2({int id = 1, required String method, List? params}) {
    return Request(id: id, jsonrpc: "2.0", method: method, params: params);
  }

  @override
  List<Object?> get props {
    return [id, jsonrpc, method, params];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jsonrpc': jsonrpc,
      'method': method,
      'params': params,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      id: map['id'] as int,
      jsonrpc: map['jsonrpc'] as String,
      method: map['method'] as String,
      params: map['params'] as List,
    );
  }
}