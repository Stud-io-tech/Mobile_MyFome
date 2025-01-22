import 'package:dio/dio.dart';

class StoreUpdateDto {
  final String id;
  final String? name;
  final String? description;
  final MultipartFile? image;
  final String? whatsapp;
  StoreUpdateDto({
    required this.id,
    this.name,
    this.description,
    this.image,
    this.whatsapp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'whatsapp': whatsapp,
    };
  }

  factory StoreUpdateDto.fromMap(Map<String, dynamic> map) {
    return StoreUpdateDto(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as MultipartFile : null,
      whatsapp: map['whatsapp'] != null ? map['whatsapp'] as String : null,
    );
  }

  @override
  bool operator ==(covariant StoreUpdateDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.whatsapp == whatsapp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      whatsapp.hashCode;
  }
}
