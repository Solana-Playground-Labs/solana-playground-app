// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class AccountValueBuilder extends ValueBuilder {
  final ExpressionBuilder isSigner;
  final ExpressionBuilder isWritable;
  final ExpressionBuilder pubkey;

  @override
  String get name => "Account";

  AccountValueBuilder({
    required this.isSigner,
    required this.isWritable,
    required this.pubkey,
  });

  @override
  AccountValue build() {
    return AccountValue(
      isSigner: isSigner.build(),
      isWritable: isWritable.build(),
      pubkey: pubkey.build(),
    );
  }

  @override
  AccountValueBuilder clone() {
    return AccountValueBuilder(
      isSigner: isSigner.clone(),
      isWritable: isWritable.clone(),
      pubkey: pubkey.clone(),
    );
  }
}

AccountValue _$AccountValueFromJson(Map<String, dynamic> json) {
  return AccountValue(
    isSigner: Expression.fromJson(json['isSigner']),
    isWritable: Expression.fromJson(json['isWritable']),
    pubkey: Expression.fromJson(json['pubkey']),
  );
}

Map<String, dynamic> _$AccountValueToJson(AccountValue value) {
  return {
    'type': value.runtimeType.toString(),
    'isSigner': value.isSigner.toJson(),
    'isWritable': value.isWritable.toJson(),
    'pubkey': value.pubkey.toJson(),
  };
}

AccountValueBuilder _$AccountValueToBuilder(AccountValue value) {
  return AccountValueBuilder(
      isSigner: value.isSigner.asBuilder(),
      isWritable: value.isWritable.asBuilder(),
      pubkey: value.pubkey.asBuilder());
}
