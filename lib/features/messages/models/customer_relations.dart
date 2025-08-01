
import 'package:lilac/features/messages/models/user_settings.dart';

class CustomerRelationships {
  final List<dynamic> blockedContacts;
  final UserSettings? userSettings;

  CustomerRelationships({
    required this.blockedContacts,
    this.userSettings,
  });

  factory CustomerRelationships.fromJson(Map<String, dynamic> json) {
    return CustomerRelationships(
      blockedContacts: json['blockedContacts']?['data'] ?? [],
      userSettings: json['userSettings']?['data'] != null
          ? UserSettings.fromJson(json['userSettings']['data'])
          : null,
    );
  }
}