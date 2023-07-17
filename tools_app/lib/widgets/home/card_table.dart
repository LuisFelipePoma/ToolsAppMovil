import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.calculate_outlined,
              color: Colors.blueAccent,
              text: 'Calculadora',
            ),
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.purpleAccent,
              text: 'Tool 2',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.pinkAccent,
              text: 'Tool 3',
            ),
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.orangeAccent,
              text: 'Tool 4',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.amberAccent,
              text: 'Tool 5',
            ),
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.deepPurple,
              text: 'Tool 6',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.cyanAccent,
              text: 'Tool 7',
            ),
            _SingleCard(
              icon: Icons.handyman_rounded,
              color: Colors.greenAccent,
              text: 'Tool 8',
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard(
      {required this.icon, required this.color, required this.text});

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: IconButton(
            icon: Icon(icon, size: 35, color: Colors.white),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        )
      ],
    );
    return _CardBackground(child: column);
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(44, 18, 42, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
