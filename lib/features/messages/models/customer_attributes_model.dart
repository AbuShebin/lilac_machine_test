
class CustomerAttributes {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String gender;
  final String? profilePhotoUrl;
  final String? square100ProfilePhotoUrl;
  final String? square300ProfilePhotoUrl;
  final String? square500ProfilePhotoUrl;
  final int age;
  final String messageReceivedFromPartnerAt;

  CustomerAttributes({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    required this.age,
    required this.messageReceivedFromPartnerAt
  });

  factory CustomerAttributes.fromJson(Map<String, dynamic> json) {
    return CustomerAttributes(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      profilePhotoUrl: json['profile_photo_url']??'',
      square100ProfilePhotoUrl: json['square100_profile_photo_url']??'',
      square300ProfilePhotoUrl: json['square300_profile_photo_url']??'',
      square500ProfilePhotoUrl: json['square500_profile_photo_url']??'',
      age: json['age'] ?? 0,
      messageReceivedFromPartnerAt:json["message_received_from_partner_at"]??""
    );
  }
}
