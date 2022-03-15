/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/cupertino.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/expression/value.dart';

class JsonValue extends Value {
  final dynamic data;

  const JsonValue({required this.data});

  @override
  List<Object> get props => [data];

  factory JsonValue.fromJson(dynamic json) {
    final data = json['data'];
    if (data is Map) {
      return JsonValue(
        data: _JsonMapValueSerialization.fromJson(Map.castFrom(data)),
      );
    } else if (data is List) {
      return JsonValue(data: _JsonListValueSerialization.fromJson(data));
    } else {
      return JsonValue(data: data);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    dynamic jsonData = {};
    if (data is Map) {
      jsonData = (data as Map).toJson();
    } else if (data is List) {
      jsonData = (data as List).toJson();
    }

    return {
      'type': classType,
      'data': jsonData,
    };
  }

  @override
  JsonValueBuilder asBuilder() {
    if (data is Map) {
      return JsonValueBuilder(data: (data as Map).recursiveAsBuilder());
    } else if (data is List) {
      return JsonValueBuilder(data: (data as List).recursiveAsBuilder());
    }
    return JsonValueBuilder(data: data);
  }
}

extension _JsonMapValueSerialization on Map {
  static Map fromJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      if (value is Map) {
        if (value['type'] != null) {
          return MapEntry(key, Expression.fromJson(Map.castFrom(value)));
        } else {
          return MapEntry(
            key,
            _JsonMapValueSerialization.fromJson(Map.castFrom(value)),
          );
        }
      } else if (value is List) {
        return MapEntry(key, _JsonListValueSerialization.fromJson(value));
      } else {
        return MapEntry(key, value);
      }
    });
  }

  Map toJson() {
    return map((key, value) {
      if (value is Expression) {
        return MapEntry(key, value.toJson());
      } else if (value is List) {
        return MapEntry(key, value.toJson());
      } else {
        return MapEntry(key, value);
      }
    });
  }
}

extension _JsonListValueSerialization on List {
  static List fromJson(List<dynamic> json) {
    return json.map((value) {
      if (value is Map) {
        return _JsonMapValueSerialization.fromJson(Map.castFrom(value));
      } else if (value is List) {
        return _JsonListValueSerialization.fromJson(value);
      } else {
        return value;
      }
    }).toList();
  }

  List toJson() {
    return map((value) {
      if (value is Expression) {
        return value.toJson();
      } else if (value is Map) {
        return value.toJson();
      } else {
        return value;
      }
    }).toList();
  }
}

extension RecursiveMapAsBuilder on Map {
  Map recursiveAsBuilder() {
    return map((key, value) {
      if (value is Expression) {
        return MapEntry(key, value.asBuilder());
      } else if (value is List) {
        return MapEntry(key, value.recursiveAsBuilder());
      } else {
        return MapEntry(key, value);
      }
    });
  }
}

extension RecursiveListAsBuilder on List {
  List recursiveAsBuilder() {
    return map((value) {
      if (value is Expression) {
        return value.asBuilder();
      } else if (value is Map) {
        return value.recursiveAsBuilder();
      } else {
        return value;
      }
    }).toList();
  }
}
