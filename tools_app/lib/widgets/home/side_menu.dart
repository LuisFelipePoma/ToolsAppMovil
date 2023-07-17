import 'dart:ui';

import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: const Opacity(
          opacity: 0.7,
          child: sideNav(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class sideNav extends StatelessWidget {
  const sideNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black12,
      child: Stack(
        children: <Widget>[
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
                      context, 'home');
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
