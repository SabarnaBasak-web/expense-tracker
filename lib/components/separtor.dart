import 'package:flutter/material.dart';

class Separtor extends StatelessWidget {
  final double height;
  const Separtor({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
