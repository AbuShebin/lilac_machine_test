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

  // Clean validation constants
  static const int _phoneNumberLength = 10;
  static const String _phonePattern = r'^[0-9]{10}$';

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(w * 0.05),
        child: Form(
          key: _formKey,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: h - kToolbarHeight - MediaQuery.of(context).padding.top - (w * 0.1),
            ),
            child: IntrinsicHeight(
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
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: w * 0.2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: w * 0.03),
                        Text("+91", style: TextStyle(fontSize: h * 0.02)),
                        Icon(Icons.arrow_drop_down, color: Colors.grey, size: h * 0.02),
                        SizedBox(
                          child: VerticalDivider(color: Colors.grey),
                          height: h * 0.03,
                        ),
                      ],
                    ),
                  ),
                  hintText: "Phone number",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: w * 0.02,
                    vertical: h * 0.02,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                validator: _validatePhoneNumber,
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
    )));
  }

  /// Validates phone number input
  /// Returns error message if validation fails, null if valid
  String? _validatePhoneNumber(String? value) {
    // Check if value is null or empty
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final trimmedValue = value.trim();

    // Check if it contains only digits and has correct length
    if (!RegExp(_phonePattern).hasMatch(trimmedValue)) {
      return 'Enter a valid $_phoneNumberLength-digit phone number';
    }

    return null; // Valid input
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