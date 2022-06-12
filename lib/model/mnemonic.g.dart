// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mnemonic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mnemonic _$MnemonicFromJson(Map<String, dynamic> json) => Mnemonic(
      phrase: json['phrase'] as String,
      change: json['change'] as int,
      account: json['account'] as int,
    );

Map<String, dynamic> _$MnemonicToJson(Mnemonic instance) => <String, dynamic>{
      'phrase': instance.phrase,
      'account': instance.account,
      'change': instance.change,
    };
