import 'dart:async';

abstract class SPInput {}

abstract class SPOutput {
  Future<void> write(dynamic data);
}

class SPConsole with SPOutput {
  final StreamController<dynamic> streamController = StreamController.broadcast();

  @override
  Future<void> write(data) async {
    streamController.add(data);
  }

  Future<void> dispose() async {
    streamController.close();
  }
}