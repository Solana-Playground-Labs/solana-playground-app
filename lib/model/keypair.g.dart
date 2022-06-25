// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keypair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Keypair _$KeypairFromJson(Map<String, dynamic> json) => Keypair(
      name: json['name'] as String,
      publicKey: (json['publicKey'] as List<dynamic>).map((e) => e as int).toList(),
      privateKey: (json['privateKey'] as List<dynamic>).map((e) => e as int).toList(),
      mnemonic: json['mnemonic'] == null
          ? null
          : Mnemonic.fromJson(json['mnemonic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeypairToJson(Keypair instance) => <String, dynamic>{
      'name': instance.name,
      'publicKey': instance.publicKey,
      'privateKey': instance.privateKey,
      'mnemonic': instance.mnemonic,
    };
