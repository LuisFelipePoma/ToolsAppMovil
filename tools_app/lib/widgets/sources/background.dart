import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [_BackgroundTheme(size, colors)],
    );
  }
}

class _BackgroundTheme extends StatelessWidget {
  const _BackgroundTheme(this.size, this.colors);
  // ignore: prefer_typing_uninitialized_variables
  final colors;
  // Variables
  final Size size;
  @override
  Widget build(BuildContext context) {
    // Metodos in Line

    final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
      ),
    );
    return Container(
      width: size.width,
      height: size.height,
      decoration: boxDecoration,
    );
  }
}
