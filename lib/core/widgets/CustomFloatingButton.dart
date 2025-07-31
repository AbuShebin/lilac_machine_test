import 'package:flutter/material.dart';
import 'package:lilac/core/utils/theme/theme.dart';

class CustomFloatingButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double? width;
  final String? image;

  const CustomFloatingButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.width,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: h * 0.06,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(w * 0.1),
          color: buttonColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null ? Image.asset(image!,height: h*0.03 ,) : SizedBox.shrink(),
             SizedBox(width: w*0.03,),
              Text(
                text,
                style: TextStyle(
                  fontSize: w * 0.048,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
