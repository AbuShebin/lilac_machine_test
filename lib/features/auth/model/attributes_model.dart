// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lilac/features/auth/model/auth_status.dart';

class AttributesModel {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String gender;
  final String fcm_token;
  final String preffered_gender;
  final String current_location;
  final String created_at;
  final String profile_photo_url;
  final String square100_profile_photo_url;
  final int age;
  final AuthStatus auth_status;
  AttributesModel({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    required this.fcm_token,
    required this.preffered_gender,
    required this.current_location,
    required this.created_at,
    required this.profile_photo_url,
    required this.square100_profile_photo_url,
    required this.age,
    required this.auth_status,
  });

  AttributesModel copyWith({
    String? name,
    String? username,
    String? email,
    String? phone,
    String? gender,
    String? fcm_token,
    String? preffered_gender,
    String? current_location,
    String? created_at,
    String? profile_photo_url,
    String? square100_profile_photo_url,
    int? age,
    AuthStatus? auth_status,
  }) {
    return AttributesModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      fcm_token: fcm_token ?? this.fcm_token,
      preffered_gender: preffered_gender ?? this.preffered_gender,
      current_location: current_location ?? this.current_location,
      created_at: created_at ?? this.created_at,
      profile_photo_url: profile_photo_url ?? this.profile_photo_url,
      square100_profile_photo_url:
          square100_profile_photo_url ?? this.square100_profile_photo_url,
      age: age ?? this.age,
      auth_status: auth_status ?? this.auth_status,
    );
  }

factory AttributesModel.fromMap(Map<String, dynamic> map) {
  return AttributesModel(
    name: map['name'] ?? '',
    username: map['username'] ?? '',
    email: map['email'] ?? '',
    phone: map['phone'] ?? '',
    gender: map['gender'] ?? '',
    fcm_token: map['fcm_token'] ?? '',
    preffered_gender: map['preffered_gender'] ?? '',
    current_location: map['current_location'] ?? '',
    created_at: map['created_at'] ?? '',
    profile_photo_url: map['profile_photo_url'] ?? '',
    square100_profile_photo_url: map['square100_profile_photo_url'] ?? '',
    age: map['age'] ?? 0,
    auth_status: map['auth_status'] != null
        ? AuthStatus.fromMap(map['auth_status'])
        : throw Exception("Missing 'auth_status' in JSON"),
  );
}



  @override
  String toString() {
    return 'AttributesModel(name: $name, username: $username, email: $email, phone: $phone, gender: $gender, fcm_token: $fcm_token, preffered_gender: $preffered_gender, current_location: $current_location, created_at: $created_at, profile_photo_url: $profile_photo_url, square100_profile_photo_url: $square100_profile_photo_url, age: $age, auth_status: $auth_status)';
  }

  @override
  bool operator ==(covariant AttributesModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.username == username &&
        other.email == email &&
        other.phone == phone &&
        other.gender == gender &&
        other.fcm_token == fcm_token &&
        other.preffered_gender == preffered_gender &&
        other.current_location == current_location &&
        other.created_at == created_at &&
        other.profile_photo_url == profile_photo_url &&
        other.square100_profile_photo_url == square100_profile_photo_url &&
        other.age == age &&
        other.auth_status == auth_status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        fcm_token.hashCode ^
        preffered_gender.hashCode ^
        current_location.hashCode ^
        created_at.hashCode ^
        profile_photo_url.hashCode ^
        square100_profile_photo_url.hashCode ^
        age.hashCode ^
        auth_status.hashCode;
  }
}
