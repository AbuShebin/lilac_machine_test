

class CustomerRelationships {
  final List<dynamic> blockedContacts;

  CustomerRelationships({
    required this.blockedContacts,
  });

  factory CustomerRelationships.fromJson(Map<String, dynamic> json) {
    return CustomerRelationships(
      blockedContacts: json['blockedContacts']?['data'] ?? [],
    );
  }
}