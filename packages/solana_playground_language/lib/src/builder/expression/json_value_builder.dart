import 'package:solana_playground_language/solana_playground_language.dart';

class JsonValueBuilder extends ValueBuilder {
  dynamic _data;

  JsonValueBuilder({required dynamic data}) : _data = data;

  dynamic get data => _data;

  void update(void Function(dynamic data) callback) {
    callback(_data);
    notifyListeners();
  }

  @override
  Value build() {
    if (_data is Map) {
      return JsonValue(data: _data.recursiveBuild());
    } else if (_data is List) {
      return JsonValue(data: _data.recursiveBuild());
    }
    throw Exception("Can not parse json value");
  }

  @override
  ValueBuilder clone() {
    if (data is List) {
      return JsonValueBuilder(data: List.of(data)); 
    } else if (data is Map) {
      return JsonValueBuilder(data: Map.of(data));
    }
    return JsonValueBuilder(data: data);
  }
}

extension RecursiveMapBuilder on Map {
  Map recursiveBuild() {
    return map((key, value) {
      if (value is ExpressionBuilder) {
        return MapEntry(key, value.build());
      }
      throw Exception("It is not expression");
    });
  }
}

extension RecursiveListBuilder on List {
  List recursiveBuild() {
    return map((value) {
      if (value is ExpressionBuilder) {
        return value.build();
      }
      throw Exception("It is not expression");
    }).toList();
  }
}
