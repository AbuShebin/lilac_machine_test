import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/custom_snackBar.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/features/auth/data/otp_service.dart';
import 'package:lilac/features/auth/presentation/otp_verification_screen.dart';
import 'package:lilac/features/chat/presentation/home_screen.dart';

final otpControllerProvider = NotifierProvider<OtpController, int>(
  () => OtpController(),
);

class OtpController extends Notifier<int> {
  sendOtp({required String phone, required BuildContext context}) async {
    final res = await ref.read(otpServiceProvider).sendOtp(phoneNumber: phone);

    return res.fold(
      (l) => showSnackBar(
        content: l.errMSg,
        context: context,
        color: Palette.snackBarErrorColor,
      ),
      (r) {
        showSnackBar(
          content: "Otp has been sent to your phone number",
          context: context,
          color: Palette.snackBarSuccessColor,
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OtpVerificationScreen(phomeNumber: phone);
            },
          ),
        );
      },
    );
  }
  
  
  verifyOtp({required String phone,required int otp, required BuildContext context}) async {
    final res = await ref.read(otpServiceProvider).verifyOtp(phoneNumber: phone, otp: otp);

    return res.fold(
      (l) { 
        print(l.errMSg);
           showSnackBar(
        content: "Invalid OTP",
        context: context,
        color: Palette.snackBarErrorColor,
      );},
      (r)  {
        showSnackBar(
          content: "Otp has been sent to your phone number",
          context: context,
          color: Palette.snackBarSuccessColor,
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  int build() => 0;
}
