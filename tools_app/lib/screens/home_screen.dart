import 'package:flutter/material.dart';
import 'package:tools_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: [
            BackgroundHome(),
          ],
        ),
      ),
    );
  }
}
