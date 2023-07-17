import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tools_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: sideNav(),
    );
  }
}

class sideNav extends StatelessWidget {
  const sideNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black38,
      child: Stack(
        children: <Widget>[
          // first child be the blur background
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0), //this is dependent on the import statment above
            child: Container(
                decoration: const BoxDecoration(color: Colors.black38)),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(),
                    SizedBox(height: 50),
                    Text('Usuario', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.pages_outlined, color: Colors.white),
                title:
                    const Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, HomeScreen.routerName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
