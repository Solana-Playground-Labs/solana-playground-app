import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/expression_builder.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'signature_pubkey_pair_meta_value_builder_cubit.dart';

class SignaturePubkeyPairMetaValueBuilderWidget extends CubitWidget<
    SignaturePubkeyPairMetaValueBuilderCubit,
    SignaturePubkeyPairMetaValueBuilderState> {
  final SignaturePubkeyParsMetaValueBuilder builder;

  SignaturePubkeyPairMetaValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    SignaturePubkeyPairMetaValueBuilderState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Public key: "),
            ExpressionBuilderWidget(builder: builder.publicKey),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text("Signature: "),
            ExpressionBuilderWidget(builder: builder.signature),
          ],
        ),
      ],
    );
  }

  @override
  SignaturePubkeyPairMetaValueBuilderCubit cubit(BuildContext context) =>
      SignaturePubkeyPairMetaValueBuilderCubit(builder);
}
