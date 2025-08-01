import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/CustomFloatingButton.dart';
import 'package:lilac/features/auth/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({required this.phoneNumber, Key? key})
      : super(key: key);

  @override
  ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  late final TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: h - kToolbarHeight - MediaQuery.of(context).padding.top,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.05),
                  Center(
                    child: Text(
                      "Enter your verification\ncode",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.03,
                        fontFamily: "Hind",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  Row(
                    children: [
                      Text(widget.phoneNumber),
                      TextButton(
                        onPressed: () {
                          // Navigate back or allow edit
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Pinput(
                    length: 6, 
                    controller: otpController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: h * 0.02),
                  Text("Didn't get anything? No worries, let's try again."),
                  TextButton(
                    onPressed: () {
                      // TODO: Trigger resend API
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  CustomFloatingButton(
                    text: "Next",
                    onPressed: () {
                      final otpText = otpController.text.trim();
                      
                      if (otpText.isEmpty || otpText.length != 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter complete 6-digit OTP')),
                        );
                        return;
                      }
            
                      final otp = int.tryParse(otpText);
            
                      if (otp == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid OTP')),
                        );
                        return;
                      }
            
                      ref
                          .read(otpControllerProvider.notifier)
                          .verifyOtp(phone: widget.phoneNumber, otp: otp, context: context);
                    },
                    buttonColor: Palette.signInwithPhoneNumberColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: h * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}