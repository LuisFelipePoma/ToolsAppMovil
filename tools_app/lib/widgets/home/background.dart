import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [_BackgroundTheme(size)],
    );
  }
}

class _BackgroundTheme extends StatelessWidget {
  const _BackgroundTheme(this.size);
  // Variables
  final Size size;
  @override
  Widget build(BuildContext context) {
    // Metodos in Line

    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffe5423e),
          // Color(0xffc1273e),
          Color(0xff7b1332),
          // Color(0xff4e0a30),
          Color(0xff2b122a),
        ],
      ),
    );
    return Container(
      width: size.width,
      height: size.height,
      decoration: boxDecoration,
    );
  }
}
