import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lilac/core/utils/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool? readOnly;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final double h;
  final double w;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.icon,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.readOnly,
    this.suffixIcon,
    this.isObscureText,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
     required this.h,
    required this.w
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: w,
            child: TextFormField(
              maxLines: maxLines,
              readOnly: readOnly ?? false,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              obscureText: isObscureText ?? false,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: w * 0.037,
                color: Palette.blackColor,
              ),
              decoration: InputDecoration(
                prefixIcon: icon != null ? Icon(icon) : null,
                hintText: labelText,
                hintStyle: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: w * 0.036,
                  color: Palette.blackColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w * 0.03),
                  borderSide: BorderSide(color: Colors.grey, width: w * 0.01),
                ),
                suffixIcon: suffixIcon,
                labelText: labelText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}