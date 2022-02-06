part of 'print_builder_widget.dart';

class _PrintBuilderCubit extends Cubit<_PrintBuilderState> {
  final PrintBuilder builder;

  _PrintBuilderCubit(this.builder) : super(_PrintBuilderState(valueRootBuilders: builder.valueRootBuilders)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(valueRootBuilders: builder.valueRootBuilders));
  }

  void remove(ValueRootBuilder valueRootBuilder) {
    builder.remove(valueRootBuilder);
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
