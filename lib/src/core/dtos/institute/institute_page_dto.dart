// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_fome/src/core/dtos/institute/institute_detail_dto.dart';

class InstitutePageDto {
  final List<InstituteDetailDto> instituteDto;
  final int totalElements;
  final int totalPages;
  InstitutePageDto({
    required this.instituteDto,
    required this.totalElements,
    required this.totalPages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instituteDto': instituteDto.map((x) => x.toMap()).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }

  factory InstitutePageDto.fromMap(Map<String, dynamic> map) {
    return InstitutePageDto(
      instituteDto: List<InstituteDetailDto>.from(
        (map['instituteDto'] as List<dynamic>).map<InstituteDetailDto>(
          (x) => InstituteDetailDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalElements: map['totalElements'] as int,
      totalPages: map['totalPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutePageDto.fromJson(String source) =>
      InstitutePageDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InstitutePageDto(instituteDto: $instituteDto, totalElements: $totalElements, totalPages: $totalPages)';

  @override
  bool operator ==(covariant InstitutePageDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.instituteDto, instituteDto) &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode =>
      instituteDto.hashCode ^ totalElements.hashCode ^ totalPages.hashCode;
}
