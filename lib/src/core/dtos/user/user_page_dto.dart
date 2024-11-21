// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_fome/src/core/dtos/user/detail_user_dto.dart';

class UserPageDto {
  final List<DetailUserDto> userDto;
  final int totalElements;
  final int totalPages;
  UserPageDto({
    required this.userDto,
    required this.totalElements,
    required this.totalPages,
  });

  @override
  String toString() =>
      'UserPageDto(userDto: $userDto, totalElements: $totalElements, totalPages: $totalPages)';

  @override
  bool operator ==(covariant UserPageDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.userDto, userDto) &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode =>
      userDto.hashCode ^ totalElements.hashCode ^ totalPages.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userDto': userDto.map((x) => x.toMap()).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }

  factory UserPageDto.fromMap(Map<String, dynamic> map) {
    return UserPageDto(
      userDto: List<DetailUserDto>.from(
        (map['userDto'] as List<dynamic>).map<DetailUserDto>(
          (x) => DetailUserDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalElements: map['totalElements'] as int,
      totalPages: map['totalPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPageDto.fromJson(String source) =>
      UserPageDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
