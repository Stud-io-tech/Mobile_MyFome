// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class InstituteSaveDto {
  final String? id;
  final String? name;
  final String? description;
  final String? city;
  final int? number;
  final String? complement;
  final String? longitude;
  final String? latitude;
  final String? whatsapp;
  final double? freight_cost_km;
  final String? user;
  InstituteSaveDto({
    this.id,
    this.name,
    this.description,
    this.city,
    this.number,
    this.complement,
    this.longitude,
    this.latitude,
    this.whatsapp,
    this.freight_cost_km,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'number': number,
      'complement': complement,
      'longitude': longitude,
      'latitude': latitude,
      'whatsapp': whatsapp,
      'freight_cost_km': freight_cost_km,
      'user': user,
    };
  }

  factory InstituteSaveDto.fromMap(Map<String, dynamic> map) {
    return InstituteSaveDto(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      number: map['number'] != null ? map['number'] as int : null,
      complement: map['complement'] != null ? map['complement'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      whatsapp: map['whatsapp'] != null ? map['whatsapp'] as String : null,
      freight_cost_km: map['freight_cost_km'] != null ? map['freight_cost_km'] as double : null,
      user: map['user'] != null ? map['user'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstituteSaveDto.fromJson(String source) => InstituteSaveDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InstituteSaveDto(id: $id, name: $name, description: $description, city: $city, number: $number, complement: $complement, longitude: $longitude, latitude: $latitude, whatsapp: $whatsapp, freight_cost_km: $freight_cost_km, user: $user)';
  }

  @override
  bool operator ==(covariant InstituteSaveDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.city == city &&
      other.number == number &&
      other.complement == complement &&
      other.longitude == longitude &&
      other.latitude == latitude &&
      other.whatsapp == whatsapp &&
      other.freight_cost_km == freight_cost_km &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      city.hashCode ^
      number.hashCode ^
      complement.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      whatsapp.hashCode ^
      freight_cost_km.hashCode ^
      user.hashCode;
  }
}
