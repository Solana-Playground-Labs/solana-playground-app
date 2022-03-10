import 'dart:async';

abstract class SPInput {}

abstract class SPOutput {
  Future<void> write(dynamic data);
}

class SPConsole with SPOutput {
  final StreamController streamController = StreamController();

  @override
  Future<void> write(data) async {
    streamController.add(data);
  }
}