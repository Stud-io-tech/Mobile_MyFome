import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCategoryDetailModel {
  final String id;
  final String name;
  final List<dynamic> created;
  final List<dynamic> updated;
  ProductCategoryDetailModel({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created': created,
      'updated': updated,
    };
  }

  factory ProductCategoryDetailModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryDetailModel(
      id: map['id'] as String,
      name: map['name'] as String,
      created: List<dynamic>.from((map['created'] as List<dynamic>)),
      updated: List<dynamic>.from((map['updated'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryDetailModel.fromJson(String source) => ProductCategoryDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductCategoryModel(id: $id, name: $name, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(covariant ProductCategoryDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      listEquals(other.created, created) &&
      listEquals(other.updated, updated);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created.hashCode ^
      updated.hashCode;
  }
}
