import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double width;
  const CustomDivider({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
