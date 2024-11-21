import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDetailDto {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final int quantity;
  final String category;
  final String institute;
  final List<dynamic> created;
  final List<dynamic> updated;
  ProductDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
    required this.institute,
    required this.created,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'category': category,
      'institute': institute,
      'created': created,
      'updated': updated,
    };
  }

  factory ProductDetailDto.fromMap(Map<String, dynamic> map) {
    return ProductDetailDto(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      category: map['category'] as String,
      institute: map['institute'] as String,
      created: List<dynamic>.from((map['created'] as List<dynamic>)),
      updated: List<dynamic>.from((map['updated'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailDto.fromJson(String source) => ProductDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ProductDetailDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.price == price &&
      other.quantity == quantity &&
      other.category == category &&
      other.institute == institute &&
      listEquals(other.created, created) &&
      listEquals(other.updated, updated);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      category.hashCode ^
      institute.hashCode ^
      created.hashCode ^
      updated.hashCode;
  }

  @override
  String toString() {
    return 'ProductDetailDto(id: $id, name: $name, description: $description, image: $image, price: $price, quantity: $quantity, category: $category, institute: $institute, created: $created, updated: $updated)';
  }
}
