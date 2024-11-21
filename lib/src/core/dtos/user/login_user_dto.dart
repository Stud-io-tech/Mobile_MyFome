import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginUserDto {
  final String email;
  LoginUserDto({
    required this.email,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory LoginUserDto.fromMap(Map<String, dynamic> map) {
    return LoginUserDto(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserDto.fromJson(String source) => LoginUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant LoginUserDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
