import 'package:flutter/material.dart';
import 'package:tools_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routerName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      drawer: const SideMenu(),
      body: const Center(
        child: Stack(
          children: [
            BackgroundHome(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
}
