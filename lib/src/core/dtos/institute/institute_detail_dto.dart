import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InstituteDetailDto {
  final String id;
  final String name;
  final String description;
  final String image;
  final String city;
  final int? number;
  final String? complement;
  final String longitude;
  final String latitude;
  final String whatsapp;
  final double freight_cost_km;
  final String user;
  final List<dynamic> created;
  final List<dynamic> updated;
  InstituteDetailDto({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.city,
    this.number,
    this.complement,
    required this.longitude,
    required this.latitude,
    required this.whatsapp,
    required this.freight_cost_km,
    required this.user,
    required this.created,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'city': city,
      'number': number,
      'complement': complement,
      'longitude': longitude,
      'latitude': latitude,
      'whatsapp': whatsapp,
      'freight_cost_km': freight_cost_km,
      'user': user,
      'created': created,
      'updated': updated,
    };
  }

  factory InstituteDetailDto.fromMap(Map<String, dynamic> map) {
    return InstituteDetailDto(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      city: map['city'] as String,
      number: map['number'] != null ? map['number'] as int : null,
      complement: map['complement'] != null ? map['complement'] as String : null,
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      whatsapp: map['whatsapp'] as String,
      freight_cost_km: map['freight_cost_km'] as double,
      user: map['user'] as String,
      created: List<dynamic>.from((map['created'] as List<dynamic>)),
      updated: List<dynamic>.from((map['updated'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory InstituteDetailDto.fromJson(String source) => InstituteDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InstituteDetailDto(id: $id, name: $name, description: $description, image: $image, city: $city, number: $number, complement: $complement, longitude: $longitude, latitude: $latitude, whatsapp: $whatsapp, freight_cost_km: $freight_cost_km, user: $user, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(covariant InstituteDetailDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.city == city &&
      other.number == number &&
      other.complement == complement &&
      other.longitude == longitude &&
      other.latitude == latitude &&
      other.whatsapp == whatsapp &&
      other.freight_cost_km == freight_cost_km &&
      other.user == user &&
      listEquals(other.created, created) &&
      listEquals(other.updated, updated);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      city.hashCode ^
      number.hashCode ^
      complement.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      whatsapp.hashCode ^
      freight_cost_km.hashCode ^
      user.hashCode ^
      created.hashCode ^
      updated.hashCode;
  }
}
