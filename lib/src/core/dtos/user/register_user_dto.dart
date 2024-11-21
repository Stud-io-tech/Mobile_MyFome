import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterUserDto {
  final String name;
  final String email;
  final String? photo;
  RegisterUserDto({
    required this.name,
    required this.email,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  factory RegisterUserDto.fromMap(Map<String, dynamic> map) {
    return RegisterUserDto(
      name: map['name'] as String,
      email: map['email'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserDto.fromJson(String source) => RegisterUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterUserDto(name: $name, email: $email, photo: $photo)';
}
