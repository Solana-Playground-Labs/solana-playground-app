import 'package:flutter/material.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/meta_value/instruction/transaction_instruction_meta_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/meta_value/signature_pubkey_pair/signature_pubkey_pair_meta_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/solana_playground/expression_builder/meta_value/signature_pubkey_pair/signer_meta_value_builder_widget.dart';
import 'package:solana_playground_language/lib.dart';

class MetaValueInfo {
  final bool isMultiple;
  final Type metaType;

  const MetaValueInfo({
    required this.isMultiple,
    required this.metaType,
  });
}

class MetaValueBuilderWidget extends StatelessWidget {
  final JsonValueBuilder builder;
  final MetaValueInfo info;

  const MetaValueBuilderWidget({
    Key? key,
    required this.builder,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (info.isMultiple) {
      return ListMetaValueBuilderWidget(
        builder: ListMetaValueBuilder(builder: builder),
        widgetBuilder: (context, data) => MetaValueBuilderWidget(
          builder: JsonValueBuilder(data: data),
          info: MetaValueInfo(
            isMultiple: false,
            metaType: info.metaType,
          ),
        ),
        onAdd: () {
          builder.update((data) {
            builder.data.add({});
          });
        },
      );
    }

    switch (info.metaType) {
      case AccountMetaValueBuilder:
        return AccountMetaValueBuilderWidget(
          builder: AccountMetaValueBuilder.fromJsonValue(builder),
        );
      case SignaturePubkeyParsMetaValueBuilder:
        return SignaturePubkeyPairMetaValueBuilderWidget(
          builder: SignaturePubkeyParsMetaValueBuilder.fromJsonValue(builder),
        );
      case TransactionInstructionMetaValueBuilder:
        return TransactionInstructionMetaValueBuilderWidget(
          builder: TransactionInstructionMetaValueBuilder(builder: builder),
        );
      case SignerMetaValueBuilder:
        return SignerMetaValueBuilderWidget(
          builder: SignerMetaValueBuilder(builder: builder),
        );

      default:
        return const Text("Unknown meta data");
    }
  }
}
