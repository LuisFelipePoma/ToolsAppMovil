import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';

class IconsOptionsDash extends StatelessWidget {
  const IconsOptionsDash({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconOptions(
                function: () => Navigator.pop(context),
                icondata: Icons.arrow_back_ios),
            _IconOptions(
                function: () {
                  calculatorProvider.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                icondata: Icons.history)
          ],
        ),
      ),
    );
  }
}

class _IconOptions extends StatelessWidget {
  const _IconOptions({
    required this.function,
    required this.icondata,
  });

  final Function()? function;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(icondata, color: Colors.white, size: 40));
  }
}
