// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walletInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfo _$WalletInfoFromJson(Map<String, dynamic> json) => WalletInfo(
      json['id'] as String?,
      json['userId'] as String?,
      json['amount'] as String?,
      json['isBlocked'] as bool?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['bonus'] as int?,
    );

Map<String, dynamic> _$WalletInfoToJson(WalletInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'bonus': instance.bonus,
    };
