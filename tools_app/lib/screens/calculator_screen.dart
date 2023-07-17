import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';
import 'package:tools_app/widgets/widgets.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          key: calculatorProvider.viewKey,
          controller: calculatorProvider.pageController,
          children: const [
            CalculatorPage(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundHome(
          colors: [
            Color(0xff08bea5),
            Color(0xff344357),
            Color(0xff202935),
          ],
        ),
        IconsOptions(),
        CalculatorDash(),
      ],
    );
  }
}

class IconsOptions extends StatelessWidget {
  const IconsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 30, right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconOptions(
                function: () => Navigator.pop(context),
                icondata: Icons.arrow_back_ios),
            IconOptions(function: () {}, icondata: Icons.history),
            IconOptions(
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

class IconOptions extends StatelessWidget {
  const IconOptions({
    super.key,
    required this.function,
    required this.icondata,
  });

  final Function()? function;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(icondata, color: Colors.white, size: 45));
  }
}
