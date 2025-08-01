import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/CustomFloatingButton.dart';
import 'package:lilac/features/auth/controller/otp_controller.dart';

class PhoneLoginScreen extends ConsumerStatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  ConsumerState<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends ConsumerState<PhoneLoginScreen> {
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(w * 0.05),
        child: Form(
          key: _formKey,
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
                      child: TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone number",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: w * 0.02,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Phone number is required';
                          }
                          if (!RegExp(r'^[0-9]{10}$')
                              .hasMatch(value.trim())) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.02),
              const Text(
                  "Fliq will send you a text with a verification code."),
              const Spacer(),
              CustomFloatingButton(
                text: "Next",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login(
                      context: context,
                      phone: phoneNumberController.text.trim(),
                      ref: ref,
                    );
                  }
                },
                buttonColor: Palette.signInwithPhoneNumberColor,
                textColor: Colors.white,
              ),
              SizedBox(height: h * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  void login({
    required BuildContext context,
    required String phone,
    required WidgetRef ref,
  }) {
    ref
        .read(otpControllerProvider.notifier)
        .sendOtp(phone: phone, context: context);
  }
}
