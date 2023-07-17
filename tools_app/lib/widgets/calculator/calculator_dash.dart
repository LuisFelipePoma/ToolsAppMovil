import 'package:flutter/material.dart';

class CalculatorDash extends StatelessWidget {
  const CalculatorDash({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.18,
      left: size.width * 0.05,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.8,
        color: Colors.black54,
      ),
    );
  }
}
