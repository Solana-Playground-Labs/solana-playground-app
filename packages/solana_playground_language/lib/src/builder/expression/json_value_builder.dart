import 'package:solana_playground_language/solana_playground_language.dart';

class JsonValueBuilder extends ValueBuilder {
  dynamic _data;

  JsonValueBuilder({required dynamic data}) : _data = data;

  dynamic get data => _data;

  set data(dynamic value) {
    _data = data;
    notifyListeners();
  }

  void update(void Function(dynamic data) callback) {
    callback(_data);
    notifyListeners();
  }

  @override
  Value build() {
    if (_data is Map) {
      return JsonValue(data: (_data as Map).recursiveBuild());
    } else if (_data is List) {
      return JsonValue(data: (_data as List).recursiveBuild());
    }
    throw Exception("Can not parse json value");
  }

  @override
  JsonValueBuilder clone() {
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
      } else if (value is List) {
        return MapEntry(key, value.recursiveBuild());
      } else {
        return MapEntry(key, value);
      }
    });
  }
}

extension RecursiveListBuilder on List {
  List recursiveBuild() {
    return map((value) {
      if (value is ExpressionBuilder) {
        return value.build();
      } else if (value is Map) {
        return value.recursiveBuild();
      } else {
        return value;
      }
    }).toList();
  }
}
