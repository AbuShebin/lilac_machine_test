
class CustomerModel {
  final String id;
  final String type;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String gender;
  final String fcmToken;
  final String preferredGender;
  final String currentLocation;
  final String createdAt;
  final String profilePhotoUrl;
  final String square100ProfilePhotoUrl;
  final int age;

  CustomerModel({
    required this.id,
    required this.type,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    required this.fcmToken,
    required this.preferredGender,
    required this.currentLocation,
    required this.createdAt,
    required this.profilePhotoUrl,
    required this.square100ProfilePhotoUrl,
    required this.age,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      fcmToken: json['fcm_token'] ?? '',
      preferredGender: json['preffered_gender'] ?? '',
      currentLocation: json['current_location'] ?? '',
      createdAt: json['created_at'] ?? '',
      profilePhotoUrl: json['profile_photo_url'] ?? '',
      square100ProfilePhotoUrl: json['square100_profile_photo_url'] ?? '',
      age: json['age'] ?? 0,
    );
  }
}
