import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DetailUserDto {
  final String id;
  final String name;
  final String email;
  final String? photo;
  final String role;
  final List<dynamic> created;
  final List<dynamic> updated;
  DetailUserDto({
    required this.id,
    required this.name,
    required this.email,
    this.photo,
    required this.role,
    required this.created,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'role': role,
      'created': created,
      'updated': updated,
    };
  }

  factory DetailUserDto.fromMap(Map<String, dynamic> map) {
    return DetailUserDto(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
      role: map['role'] as String,
      created: List<dynamic>.from((map['created'] as List<dynamic>)),
      updated: List<dynamic>.from((map['updated'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailUserDto.fromJson(String source) => DetailUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailUserDto(id: $id, name: $name, email: $email, photo: $photo, role: $role, created: $created, updated: $updated)';
  }
}
