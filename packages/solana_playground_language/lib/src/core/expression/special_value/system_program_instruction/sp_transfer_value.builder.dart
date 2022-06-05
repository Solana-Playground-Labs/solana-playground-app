// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_transfer_value.dart';

// **************************************************************************
// ValueBuilderGenerator
// **************************************************************************

class SpTransferValueBuilder extends ValueBuilder {
  final ExpressionBuilder fromPubkey;
  final ExpressionBuilder toPubkey;
  final ExpressionBuilder lamports;

  @override
  String get name => "SpTransfer";

  SpTransferValueBuilder({
    required this.fromPubkey,
    required this.toPubkey,
    required this.lamports,
  });

  @override
  SpTransferValue build() {
    return SpTransferValue(
      fromPubkey: fromPubkey.build(),
      toPubkey: toPubkey.build(),
      lamports: lamports.build(),
    );
  }

  @override
  SpTransferValueBuilder clone() {
    return SpTransferValueBuilder(
      fromPubkey: fromPubkey.clone(),
      toPubkey: toPubkey.clone(),
      lamports: lamports.clone(),
    );
  }
}

SpTransferValue _$SpTransferValueFromJson(Map<String, dynamic> json) {
  return SpTransferValue(
    fromPubkey: Expression.fromJson(json['fromPubkey']),
    toPubkey: Expression.fromJson(json['toPubkey']),
    lamports: Expression.fromJson(json['lamports']),
  );
}

Map<String, dynamic> _$SpTransferValueToJson(SpTransferValue value) {
  return {
    'type': value.runtimeType.toString(),
    'fromPubkey': value.fromPubkey.toJson(),
    'toPubkey': value.toPubkey.toJson(),
    'lamports': value.lamports.toJson(),
  };
}

SpTransferValueBuilder _$SpTransferValueToBuilder(SpTransferValue value) {
  return SpTransferValueBuilder(
      fromPubkey: value.fromPubkey.asBuilder(),
      toPubkey: value.toPubkey.asBuilder(),
      lamports: value.lamports.asBuilder());
}
