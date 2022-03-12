import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'signer_meta_value_builder_state.dart';

class SignerMetaValueBuilderCubit extends Cubit<SignerMetaValueBuilderState> {
  final SignerMetaValueBuilder builder;

  SignerMetaValueBuilderCubit(this.builder)
      : super(SignerMetaValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

