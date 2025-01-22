import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreDetailDto {
  final String id;
  final String name;
  final String description;
  final String image;
  final bool actived;
  final String whatsapp;
  final String userId;
  StoreDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.actived,
    required this.whatsapp,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'actived': actived,
      'whatsapp': whatsapp,
      'user_id': userId,
    };
  }

  factory StoreDetailDto.fromMap(Map<String, dynamic> map) {
    return StoreDetailDto(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      actived: map['actived'] as bool,
      whatsapp: map['whatsapp'] as String,
      userId: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreDetailDto.fromJson(String source) => StoreDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant StoreDetailDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.actived == actived &&
      other.whatsapp == whatsapp &&
      other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      actived.hashCode ^
      whatsapp.hashCode ^
      userId.hashCode;
  }
}
