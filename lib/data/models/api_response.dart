import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/components/networking/api_exception.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  final int? code;
  final String? message;

  @JsonKey(name: 'data', includeIfNull: false)
  final T? _data;

  // use for update avatar of user api
  final String? link;

  const ApiResponse({
    T? data,
    this.code,
    this.message,
    this.link,
  }) : _data = data;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromT) {
    return _$ApiResponseFromJson(json, fromT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  @override
  List<Object> get props => [];

  T get data => _getData();

  T _getData() {
    if (0 != code && (message?.isNotEmpty ?? false || _data == null)) {
      throw ApiException(message: message!);
    }
    return _data as T;
  }
}
