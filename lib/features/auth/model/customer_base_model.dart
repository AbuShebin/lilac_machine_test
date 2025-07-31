import 'package:lilac/features/auth/model/attributes_model.dart';

class CustomerBaseModelModel {
  final String type;
  final String id;
  final AttributesModel attributes;
  CustomerBaseModelModel({
    required this.type,
    required this.id,
    required this.attributes,
  });

  CustomerBaseModelModel copyWith({
    String? type,
    String? id,
    AttributesModel? attributes,
  }) {
    return CustomerBaseModelModel(
      type: type ?? this.type,
      id: id ?? this.id,
      attributes: attributes ?? this.attributes,
    );
  }

  factory CustomerBaseModelModel.fromJson(Map<String, dynamic> json) {
    return CustomerBaseModelModel(
      type: json['type']??"",
      id: json['id']??"",
      attributes:  json['attributes'] != null
        ? AttributesModel.fromMap(json['attributes'])
        : throw Exception("Missing 'attributs' in JSON"),
    );
  }

  @override
  String toString() =>
      'CustomerBaseModelModel(type: $type, id: $id, attributes: $attributes)';

  @override
  bool operator ==(covariant CustomerBaseModelModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.id == id &&
        other.attributes == attributes;
  }

  @override
  int get hashCode => type.hashCode ^ id.hashCode ^ attributes.hashCode;
}
