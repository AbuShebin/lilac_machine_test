import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/core/utils/custom_snackBar.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/features/auth/service/otp_service.dart';
import 'package:lilac/features/auth/view/otp_verification_screen.dart';
import 'package:lilac/features/messages/view/contact_users_screen.dart';

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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OtpVerificationScreen(phoneNumber: phone);
            },
          ),
        );
      },
    );
  }

  verifyOtp({
    required String phone,
    required int otp,
    required BuildContext context,
  }) async {
    final res = await ref
        .read(otpServiceProvider)
        .verifyOtp(phoneNumber: phone, otp: otp);

    return res.fold(
      (l) {
        print("left worked ${l.errMSg}");
        showSnackBar(
          content: "Invalid OTP",
          context: context,
          color: Palette.snackBarErrorColor,
        );
      },
      (r) {
        print("right worked");

        final data = ref
            .read(customerModelProvider.notifier)
            .update((state) => r);
        ref.read(userIdProvider.notifier).update((state) => data?.id,);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return ContactUsersScreen();
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
