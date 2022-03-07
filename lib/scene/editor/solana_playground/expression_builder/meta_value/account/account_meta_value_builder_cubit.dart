import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'account_meta_value_builder_state.dart';

class AccountMetaValueBuilderCubit extends Cubit<AccountMetaValueBuilderState> {
  final AccountMetaValueBuilder builder;

  AccountMetaValueBuilderCubit(this.builder)
      : super(AccountMetaValueBuilderState()) {
    builder.addListener(listener);
  }

  void listener() {}

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}
