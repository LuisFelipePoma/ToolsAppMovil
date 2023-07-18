import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';
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
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.8,
                    maxHeight: size.height * 0.08,
                  ),
                  child: Text(
                    calculatorProvider.prompt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                Text(
                  calculatorProvider.previousResult,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
