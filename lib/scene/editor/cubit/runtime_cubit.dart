import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';

part 'runtime_state.dart';

class RuntimeCubit extends Cubit<RuntimeState> {
  final SPPackageBuilder packageBuilder;

  RuntimeCubit(this.packageBuilder)
      : super(const RuntimeState(
          status: RuntimeStatus.idle,
          result: null,
        ));

  Future<void> build() async {
    if (state.status != RuntimeStatus.idle) return;
    try {
      emit(state.copyWith(status: RuntimeStatus.compiling));
      final package = packageBuilder.build();
      emit(state.copyWith(package: package));
    } finally {
      emit(state.copyWith(status: RuntimeStatus.idle));
    }
  }
}
