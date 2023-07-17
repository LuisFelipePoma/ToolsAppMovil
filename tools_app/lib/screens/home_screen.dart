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
            BackgroundHome(colors: [
              Color(0xffe5423e),
              Color(0xff7b1332),
              Color(0xff2b122a),
            ]),
            _HomeBody(),
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

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // Titles
          PageTitle(),

          // Card Table
          CardTable(),
        ],
      ),
    );
  }
}
