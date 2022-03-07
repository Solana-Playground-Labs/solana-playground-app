import 'package:solana_playground_language/solana_playground_language.dart';

class AccountMetaValueBuilder extends MetaValueBuilder {
  final ExpressionBuilder isSigner;
  final ExpressionBuilder isWritable;
  final ExpressionBuilder pubkey;

  AccountMetaValueBuilder({
    required this.isSigner,
    required this.isWritable,
    required this.pubkey,
  });

  @override
  Value build() {
    return JsonValue(data: {
      "isSigner": isSigner,
      "isWritable": isWritable,
      "pubkey": pubkey,
    });
  }

  @override
  Builder clone() {
    return AccountMetaValueBuilder(
      isSigner: isSigner,
      isWritable: isWritable,
      pubkey: pubkey,
    );
  }
}
