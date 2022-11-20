// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['email'] as String,
      json['name'] as String,
      json['avatar'] as String,
      json['country'] as String,
      json['phone'] as String,
      (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      json['language'] as String,
      json['birthday'] as String,
      json['isActivated'] as bool,
      WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>),
      json['requireNote'] as String,
      json['level'] as String,
      json['isPhoneActivivated'] as bool,
      json['timezone'] as int,
      json['canSendMessage'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday,
      'isActivated': instance.isActivated,
      'walletInfo': instance.walletInfo,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'isPhoneActivivated': instance.isPhoneActivivated,
      'timezone': instance.timezone,
      'canSendMessage': instance.canSendMessage,
    };
