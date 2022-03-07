import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'account_meta_value_builder_cubit.dart';

class AccountMetaValueBuilderWidget extends CubitWidget<
    AccountMetaValueBuilderCubit, AccountMetaValueBuilderState> {
  final AccountMetaValueBuilder builder;

  AccountMetaValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, AccountMetaValueBuilderState state) {
    return Text("account meta");
  }

  @override
  AccountMetaValueBuilderCubit cubit(BuildContext context) =>
      AccountMetaValueBuilderCubit(builder);
}
