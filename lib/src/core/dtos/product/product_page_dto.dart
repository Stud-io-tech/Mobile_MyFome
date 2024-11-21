// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';

class ProductPageDto {
  final List<ProductDetailDto> productDto;
  final int totalElements;
  final int totalPages;
  ProductPageDto({
    required this.productDto,
    required this.totalElements,
    required this.totalPages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productDto': productDto.map((x) => x.toMap()).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }

  factory ProductPageDto.fromMap(Map<String, dynamic> map) {
    return ProductPageDto(
      productDto: List<ProductDetailDto>.from(
        (map['productDto'] as List<dynamic>).map<ProductDetailDto>(
          (x) => ProductDetailDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalElements: map['totalElements'] as int,
      totalPages: map['totalPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPageDto.fromJson(String source) =>
      ProductPageDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductPageDto(productDto: $productDto, totalElements: $totalElements, totalPages: $totalPages)';

  @override
  bool operator ==(covariant ProductPageDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.productDto, productDto) &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode =>
      productDto.hashCode ^ totalElements.hashCode ^ totalPages.hashCode;
}
