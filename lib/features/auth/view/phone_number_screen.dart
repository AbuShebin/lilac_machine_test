import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/CustomFloatingButton.dart';
import 'package:lilac/features/auth/controller/otp_controller.dart';
import 'package:lilac/features/auth/view/otp_verification_screen.dart';

class PhoneNumberScreen extends ConsumerWidget {
  PhoneNumberScreen({super.key});
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.05),
            Text(
              "Enter your phone\nnumber",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: h * 0.03,
                fontFamily: "Hind",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: h * 0.04),
            Container(
              height: h * 0.06,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: w * 0.03),
                  Text("+91", style: TextStyle(fontSize: h * 0.02)),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                  SizedBox(
                    child: VerticalDivider(color: Colors.grey),
                    height: h * 0.03,
                  ),
                  Expanded(
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: w * 0.02,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.02),

            Text("Fliq will send you a text with a verification code."),
            Spacer(),
            CustomFloatingButton(
              text: "Next",
              onPressed: () {
                login(context: context,phone: phoneNumberController.text,ref: ref);
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

  login({required BuildContext context,required String phone,required WidgetRef ref}) {
      ref.read(otpControllerProvider.notifier).sendOtp(phone: phone,context: context  );
  }
}
