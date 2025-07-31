class UserSettings {
  final String type;
  final String id;

  UserSettings({
    required this.type,
    required this.id,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      type: json['type'] ?? '',
      id: json['id'] ?? '',
    );
  }
}