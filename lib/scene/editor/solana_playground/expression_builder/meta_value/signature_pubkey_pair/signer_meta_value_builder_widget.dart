/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'signer_meta_value_builder_cubit.dart';

class SignerMetaValueBuilderWidget extends CubitWidget<
    SignerMetaValueBuilderCubit, SignerMetaValueBuilderState> {
  final SignerMetaValueBuilder builder;

  SignerMetaValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, SignerMetaValueBuilderState state) {
    final theme = Theme.of(context);
    return SPCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Public key:  ", style: theme.textTheme.bodyText1),
              Flexible(child: ExpressionBuilderWidget(builder: builder.pubKey)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Private key: ", style: theme.textTheme.bodyText1),
              Flexible(child: ExpressionBuilderWidget(builder: builder.privateKey)),
            ],
          )
        ],
      ),
    );
  }

  @override
  SignerMetaValueBuilderCubit cubit(BuildContext context) =>
      SignerMetaValueBuilderCubit(builder);
}
