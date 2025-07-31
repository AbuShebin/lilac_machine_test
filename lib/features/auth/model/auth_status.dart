// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthStatus {
  final String access_token;
  final String token_type;
  AuthStatus({
    required this.access_token,
    required this.token_type,
  });
  

  AuthStatus copyWith({
    String? access_token,
    String? token_type,
  }) {
    return AuthStatus(
      access_token: access_token ?? this.access_token,
      token_type: token_type ?? this.token_type,
    );
  }

  factory AuthStatus.fromMap(Map<String, dynamic> map) {
    return AuthStatus(
      access_token: map['access_token']??"" ,
      token_type: map['token_type']??"" ,
    );
  }

  factory AuthStatus.fromJson(String source) => AuthStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthStatus(access_token: $access_token, token_type: $token_type)';

  @override
  bool operator ==(covariant AuthStatus other) {
    if (identical(this, other)) return true;
  
    return 
      other.access_token == access_token &&
      other.token_type == token_type;
  }

  @override
  int get hashCode => access_token.hashCode ^ token_type.hashCode;
}
