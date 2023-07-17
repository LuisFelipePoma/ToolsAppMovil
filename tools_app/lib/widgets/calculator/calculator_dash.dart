import 'package:flutter/material.dart';
import 'package:tools_app/widgets/widgets.dart';

class CalculatorDash extends StatelessWidget {
  const CalculatorDash({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.18,
      left: size.width * 0.05,
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.8,
        // color: Colors.black54,
        child: Column(
          children: [
            const RowScreen(),
            SizedBox(height: (size.height * 0.04)),
            const CalculatorButtons(),
          ],
        ),
      ),
    );
  }
}

class RowScreen extends StatelessWidget {
  const RowScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Data',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 65,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'data',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
