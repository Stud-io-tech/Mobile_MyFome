// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_fome/src/core/dtos/productCategory/product_category_detail_dto.dart';

class ProductCategoryPageDto {
  final List<ProductCategoryDetailModel> productCategoryDto;
  final int totalElements;
  final int totalPages;
  ProductCategoryPageDto({
    required this.productCategoryDto,
    required this.totalElements,
    required this.totalPages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productCategoryDto': productCategoryDto.map((x) => x.toMap()).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }

  factory ProductCategoryPageDto.fromMap(Map<String, dynamic> map) {
    return ProductCategoryPageDto(
      productCategoryDto: List<ProductCategoryDetailModel>.from(
        (map['productCategoryDto'] as List<dynamic>)
            .map<ProductCategoryDetailModel>(
          (x) => ProductCategoryDetailModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalElements: map['totalElements'] as int,
      totalPages: map['totalPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryPageDto.fromJson(String source) =>
      ProductCategoryPageDto.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductCategoryPageDto(productCategoryDto: $productCategoryDto, totalElements: $totalElements, totalPages: $totalPages)';

  @override
  bool operator ==(covariant ProductCategoryPageDto other) {
    if (identical(this, other)) return true;

    return listEquals(other.productCategoryDto, productCategoryDto) &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode =>
      productCategoryDto.hashCode ^
      totalElements.hashCode ^
      totalPages.hashCode;
}
