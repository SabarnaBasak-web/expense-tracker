import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  const CustomText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize ?? 15,
          color: fontColor),
    );
  }
}
