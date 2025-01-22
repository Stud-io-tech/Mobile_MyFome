// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetailDto {
  final String id;
  final String name;
  final String email;
  final String? image;
  final bool actived;
  UserDetailDto({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    required this.actived,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'actived': actived,
    };
  }

  factory UserDetailDto.fromMap(Map<String, dynamic> map) {
    return UserDetailDto(
        id: map['id'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        image: map['image'] != null ? map['image'] as String : null,
        actived: map['actived'] as bool);
  }

  String toJson() => json.encode(toMap());

  factory UserDetailDto.fromJson(String source) =>
      UserDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserDetailDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.image == image &&
        other.actived == actived;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        image.hashCode ^
        actived.hashCode;
  }
}