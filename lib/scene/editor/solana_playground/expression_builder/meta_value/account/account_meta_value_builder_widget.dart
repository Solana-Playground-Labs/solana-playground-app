import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'account_meta_value_builder_cubit.dart';

class AccountMetaValueBuilderWidget extends CubitWidget<
    AccountMetaValueBuilderCubit, AccountMetaValueBuilderState> {
  final AccountMetaValueBuilder builder;

  AccountMetaValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, AccountMetaValueBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      level: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pubkey: ", style: theme.textTheme.bodyText1),
              Flexible(
                child: IntrinsicWidth(
                    child: ExpressionBuilderWidget(builder: builder.pubkey)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Is writable", style: theme.textTheme.bodyText1),
              const SizedBox(width: 12),
              Flexible(
                child: IntrinsicWidth(
                  child: ExpressionBuilderWidget(builder: builder.isWritable),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Is signer: ", style: theme.textTheme.bodyText1),
              Flexible(
                child: IntrinsicWidth(
                  child: ExpressionBuilderWidget(builder: builder.isSigner),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  AccountMetaValueBuilderCubit cubit(BuildContext context) =>
      AccountMetaValueBuilderCubit(builder);
}
