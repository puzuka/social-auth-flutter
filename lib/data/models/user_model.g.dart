// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['Id'] as int,
      name: json['Name'] as String,
      email: json['Email'] as String,
      token: json['Token'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Email': instance.email,
      'Token': instance.token,
    };
