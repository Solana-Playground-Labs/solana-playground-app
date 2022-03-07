import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'signature_pubkey_pair_meta_value_builder_state.dart';

class SignaturePubkeyPairMetaValueBuilderCubit
    extends Cubit<SignaturePubkeyPairMetaValueBuilderState> {
  final SignaturePubkeyParsMetaValueBuilder builder;

  SignaturePubkeyPairMetaValueBuilderCubit(this.builder)
      : super(SignaturePubkeyPairMetaValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

