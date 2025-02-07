import 'dart:convert';

class StoreDetailDto {
  final String id;
  final String ownerId;
  final String name;
  final String description;
  final String image;
  final String whatsapp;
  StoreDetailDto({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.image,
    required this.whatsapp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'owner_id': ownerId,
      'name': name,
      'description': description,
      'image': image,
      'whatsapp': whatsapp,
    };
  }

  factory StoreDetailDto.fromMap(Map<String, dynamic> map) {
    return StoreDetailDto(
      id: map['id'] as String,
      ownerId: map['owner_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      whatsapp: map['whatsapp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreDetailDto.fromJson(String source) =>
      StoreDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant StoreDetailDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ownerId == ownerId &&
        other.name == name &&
        other.description == description &&
        other.whatsapp == whatsapp &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ownerId.hashCode ^
        name.hashCode ^
        description.hashCode ^
        whatsapp.hashCode ^
        image.hashCode;
  }
}
