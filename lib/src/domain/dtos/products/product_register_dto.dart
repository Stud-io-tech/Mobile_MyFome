// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductRegisterDto {
  final String name;
  final String description;
  final String price;
  final String amount;
  final String storeId;
  ProductRegisterDto({
    required this.name,
    required this.description,
    required this.price,
    required this.amount,
    required this.storeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'amount': amount,
      'store_id': storeId,
    };
  }

  factory ProductRegisterDto.fromMap(Map<String, dynamic> map) {
    return ProductRegisterDto(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      amount: map['amount'] as String,
      storeId: map['store_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductRegisterDto.fromJson(String source) => ProductRegisterDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
