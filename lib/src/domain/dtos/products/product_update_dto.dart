import 'dart:convert';

import 'package:dio/dio.dart';

class ProductUpdateDto {
  final String id;
  final String? name;
  final String? description;
  final MultipartFile? image;
  final double? price;
  final int? quantity;
  ProductUpdateDto({
    required this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductUpdateDto.fromMap(Map<String, dynamic> map) {
    return ProductUpdateDto(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as MultipartFile : null,
      price: map['price'] != null ? map['price'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant ProductUpdateDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.price == price &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
