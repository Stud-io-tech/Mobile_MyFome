// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoreRegisterDto {
  final String name;
  final String description;
  final String whatsapp;
  StoreRegisterDto({
    required this.name,
    required this.description,
    required this.whatsapp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'whatsapp': whatsapp,
    };
  }

  factory StoreRegisterDto.fromMap(Map<String, dynamic> map) {
    return StoreRegisterDto(
      name: map['name'] as String,
      description: map['description'] as String,
      whatsapp: map['whatsapp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreRegisterDto.fromJson(String source) => StoreRegisterDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant StoreRegisterDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.whatsapp == whatsapp;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ whatsapp.hashCode;
}
