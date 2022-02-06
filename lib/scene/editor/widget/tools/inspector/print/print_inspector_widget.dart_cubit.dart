part of 'print_inspector_widget.dart_widget.dart';

class _PrintInspectorCubit extends Cubit<_PrintInspectorState> {
  final PrintBuilder builder;

  _PrintInspectorCubit(this.builder) : super(_PrintInspectorState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

