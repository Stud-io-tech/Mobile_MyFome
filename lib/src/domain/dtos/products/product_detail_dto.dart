import 'dart:convert';

class ProductDetailDto {
  final String id;
  final String name;
  final String description;
  final String image;
  final bool actived;
  final double price;
  final int quantity;
  final String storeId;
  ProductDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.actived,
    required this.price,
    required this.quantity,
    required this.storeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'actived': actived,
      'price': price,
      'quantity': quantity,
      'id_store': storeId,
    };
  }

  factory ProductDetailDto.fromMap(Map<String, dynamic> map) {
    return ProductDetailDto(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      actived: map['actived'] as bool,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      storeId: map['id_store'] as String,
    );
  }

  factory ProductDetailDto.fromJson(String source) => ProductDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ProductDetailDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.actived == actived &&
      other.price == price &&
      other.quantity == quantity &&
      other.storeId == storeId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      actived.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      storeId.hashCode;
  }
}
