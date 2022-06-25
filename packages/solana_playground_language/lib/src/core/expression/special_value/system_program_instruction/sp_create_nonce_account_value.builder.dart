// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_create_nonce_account_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class SpCreateNonceAccountValueBuilder extends ValueBuilder {
  final ExpressionBuilder fromPubkey;
  final ExpressionBuilder noncePubkey;
  final ExpressionBuilder authorizedPubkey;
  final ExpressionBuilder lamports;

  @override
  String get name => "SpCreateNonceAccount";

  SpCreateNonceAccountValueBuilder({
    required this.fromPubkey,
    required this.noncePubkey,
    required this.authorizedPubkey,
    required this.lamports,
  });

  @override
  SpCreateNonceAccountValue build() {
    return SpCreateNonceAccountValue(
      fromPubkey: fromPubkey.build(),
      noncePubkey: noncePubkey.build(),
      authorizedPubkey: authorizedPubkey.build(),
      lamports: lamports.build(),
    );
  }

  @override
  SpCreateNonceAccountValueBuilder clone() {
    return SpCreateNonceAccountValueBuilder(
      fromPubkey: fromPubkey.clone(),
      noncePubkey: noncePubkey.clone(),
      authorizedPubkey: authorizedPubkey.clone(),
      lamports: lamports.clone(),
    );
  }
}

SpCreateNonceAccountValue _$SpCreateNonceAccountValueFromJson(Map<String, dynamic> json) {
  return SpCreateNonceAccountValue(
    fromPubkey: Expression.fromJson(json['fromPubkey']),
    noncePubkey: Expression.fromJson(json['noncePubkey']),
    authorizedPubkey: Expression.fromJson(json['authorizedPubkey']),
    lamports: Expression.fromJson(json['lamports']),
  );
}

Map<String, dynamic> _$SpCreateNonceAccountValueToJson(SpCreateNonceAccountValue value) {
  return {
    'type': value.runtimeType.toString(),
    'fromPubkey': value.fromPubkey.toJson(),
    'noncePubkey': value.noncePubkey.toJson(),
    'authorizedPubkey': value.authorizedPubkey.toJson(),
    'lamports': value.lamports.toJson(),
  };
}

SpCreateNonceAccountValueBuilder _$SpCreateNonceAccountValueToBuilder(
    SpCreateNonceAccountValue value) {
  return SpCreateNonceAccountValueBuilder(
      fromPubkey: value.fromPubkey.asBuilder(),
      noncePubkey: value.noncePubkey.asBuilder(),
      authorizedPubkey: value.authorizedPubkey.asBuilder(),
      lamports: value.lamports.asBuilder());
}
