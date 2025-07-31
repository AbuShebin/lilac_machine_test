import 'package:lilac/features/contach_users/models/customer_attributes_model.dart';
import 'package:lilac/features/contach_users/models/customer_relations.dart';

class CustomerModel {
  final String type;
  final String id;
  final CustomerAttributes attributes;
  final CustomerRelationships relationships;

  CustomerModel({
    required this.type,
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      attributes: CustomerAttributes.fromJson(json['attributes']),
      relationships: CustomerRelationships.fromJson(json['relationships']),
    );
  }
}