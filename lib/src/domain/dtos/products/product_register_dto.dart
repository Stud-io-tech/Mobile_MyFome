import 'package:dio/dio.dart';

class ProductRegisterDto{
  final String name;
  final String description;
  final MultipartFile image;
  final double price;
  final int quantity;
  final String storeId;
  ProductRegisterDto({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.storeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'store_id': storeId,
    };
  }

  factory ProductRegisterDto.fromMap(Map<String, dynamic> map) {
    return ProductRegisterDto(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as MultipartFile,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      storeId: map['store_id'] as String,
    );
  }

  @override
  bool operator ==(covariant ProductRegisterDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.price == price &&
      other.quantity == quantity &&
      other.storeId == storeId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      storeId.hashCode;
  }
}
