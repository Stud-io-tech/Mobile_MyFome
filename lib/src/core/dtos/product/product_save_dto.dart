import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductSaveDto {
  final String? id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String institute;
  final String category;
  final bool? actived;
  final bool? valid;
  ProductSaveDto({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.institute,
    required this.category,
    this.actived,
    this.valid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'institute': institute,
      'category': category,
      'actived': actived,
      'valid': valid,
    };
  }

  factory ProductSaveDto.fromMap(Map<String, dynamic> map) {
    return ProductSaveDto(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      institute: map['institute'] as String,
      category: map['category'] as String,
      actived: map['actived'] != null ? map['actived'] as bool : null,
      valid: map['valid'] != null ? map['valid'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSaveDto.fromJson(String source) => ProductSaveDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductSaveDto(id: $id, name: $name, description: $description, price: $price, quantity: $quantity, institute: $institute, category: $category, actived: $actived, valid: $valid)';
  }

  @override
  bool operator ==(covariant ProductSaveDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.quantity == quantity &&
      other.institute == institute &&
      other.category == category &&
      other.actived == actived &&
      other.valid == valid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      institute.hashCode ^
      category.hashCode ^
      actived.hashCode ^
      valid.hashCode;
  }
}
