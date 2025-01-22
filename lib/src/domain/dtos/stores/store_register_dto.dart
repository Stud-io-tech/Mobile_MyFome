import 'package:dio/dio.dart';

class StoreRegisterDto {
  final String name;
  final String description;
  final MultipartFile image;
  final String whatsapp;
  StoreRegisterDto({
    required this.name,
    required this.description,
    required this.image,
    required this.whatsapp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'whatsapp': whatsapp,
    };
  }

  factory StoreRegisterDto.fromMap(Map<String, dynamic> map) {
    return StoreRegisterDto(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as MultipartFile,
      whatsapp: map['whatsapp'] as String,
    );
  }

  @override
  bool operator ==(covariant StoreRegisterDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.whatsapp == whatsapp;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      whatsapp.hashCode;
  }
}
