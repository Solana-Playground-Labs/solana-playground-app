import 'package:observable/observable.dart';
import 'package:solana_playground_language/lib.dart';

abstract class MetaValueBuilder extends Builder {
  Value build();
}

class ListMetaValueBuilder extends MetaValueBuilder with ChangeNotifier {
  final JsonValueBuilder _builder;

  List<dynamic> get data => _builder.data;

  ListMetaValueBuilder({required JsonValueBuilder builder})
      : _builder = builder {
    _builder.update((data) {
      data ??= [];
    });
    _builder.addListener(listener);
  }

  void listener() {
    notifyListeners();
  }

  void add(dynamic rawData) {
    data.add(rawData);
  }

  @override
  JsonValue build() {
    return JsonValue(data: data.map((e) => e.build()).toList());
  }

  @override
  Builder clone() {
    return ListMetaValueBuilder(builder: _builder);
  }
}
