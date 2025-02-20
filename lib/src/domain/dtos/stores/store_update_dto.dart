
class StoreUpdateDto {
  final String id;
  final String? name;
  final String? description;
  StoreUpdateDto({
    required this.id,
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory StoreUpdateDto.fromMap(Map<String, dynamic> map) {
    return StoreUpdateDto(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  @override
  bool operator ==(covariant StoreUpdateDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode;
  }
}
