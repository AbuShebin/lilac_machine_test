class ApiConstants {
  static const String baseURl = "https://test.myfliqapp.com/api/v1";
  static const String sendOtpUrl = "$baseURl/auth/registration-otp-codes/actions/phone/send-otp";
  static const String verifyOtpUrl = "$baseURl/auth/registration-otp-codes/actions/phone/verify-otp";
  static const String contactUsersUrl = "$baseURl/chat/chat-messages/queries/contact-users";
}