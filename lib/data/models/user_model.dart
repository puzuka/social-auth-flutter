import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Email')
  final String email;

  @JsonKey(name: 'Token')
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
        id: id,
        name: name,
        token: token,
        email: email,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        token,
      ];
}
