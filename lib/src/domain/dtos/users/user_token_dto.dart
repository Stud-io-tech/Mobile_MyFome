import 'dart:convert';

class UserTokenDto {
  final String token;
  UserTokenDto({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory UserTokenDto.fromMap(Map<String, dynamic> map) {
    return UserTokenDto(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokenDto.fromJson(String source) => UserTokenDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserTokenDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
