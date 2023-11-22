import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData iconName;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.iconName,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      onTapOutside: (e) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          prefixIcon: Icon(iconName),
          hintStyle: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.grey.shade800,
          )),
    );
  }
}
