import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/CustomFloatingButton.dart';
import 'package:lilac/features/auth/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends ConsumerWidget {
  final String phomeNumber;
  const OtpVerificationScreen({required this.phomeNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.05),
            Text(
              "Enter your verification\n code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: h * 0.03,
                fontFamily: "Hind",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: h * 0.04),
            Row(
              children: [
                Text(phomeNumber),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Pinput(length: 6, controller: otpController),

            SizedBox(height: h * 0.02),

            Align(
              alignment: Alignment.topLeft,
              child: Text("Didn’t get anything? No worries, let’s try again."),
            ),
            TextButton(
              onPressed: () {
                ///to api call
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Resend",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(),
            CustomFloatingButton(
              text: "Next",
              onPressed: () {
                final otpText = otpController.text.trim();

                if (otpText.isEmpty || int.tryParse(otpText) == null) {
                  // Show error or toast
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid OTP')),
                  );
                  return;
                }

                final otp = int.parse(otpText);
                ref
                    .read(otpControllerProvider.notifier)
                    .verifyOtp(phone: phomeNumber, otp: otp, context: context);
              },
              buttonColor: Palette.signInwithPhoneNumberColor,
              textColor: Colors.white,
            ),
            SizedBox(height: h * 0.05),
          ],
        ),
      ),
    );
  }
}
