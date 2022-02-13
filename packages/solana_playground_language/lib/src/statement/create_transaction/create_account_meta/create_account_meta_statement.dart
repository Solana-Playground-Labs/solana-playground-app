import 'package:solana_playground_language/solana_playground_language.dart';

class CreateAccountMetaStatement extends BaseStatement {
  static InternalType pubkeyType = const InternalString();
  final BaseValue pubkey;

  static InternalType isSignerType = const InternalBool();
  final BaseValue isSigner;

  static InternalType isWritableType = const InternalBool();
  final BaseValue isWritable;

  const CreateAccountMetaStatement({
    required this.pubkey,
    required this.isSigner,
    required this.isWritable,
  });

  @override
  List<Object> get props => [
        pubkeyType,
        pubkey,
        isSignerType,
        isSigner,
        isWritableType,
        isWritable,
      ];
}
