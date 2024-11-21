import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCategorySaveDto {
  final String? id;
  final String name;
  final bool? actived;
  ProductCategorySaveDto({
    this.id,
    required this.name,
    this.actived,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'actived': actived,
    };
  }

  factory ProductCategorySaveDto.fromMap(Map<String, dynamic> map) {
    return ProductCategorySaveDto(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      actived: map['actived'] != null ? map['actived'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategorySaveDto.fromJson(String source) => ProductCategorySaveDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCategorySaveDto(id: $id, name: $name, actived: $actived)';

  @override
  bool operator ==(covariant ProductCategorySaveDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.actived == actived;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ actived.hashCode;
}
