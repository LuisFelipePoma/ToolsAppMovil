import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';
import 'package:tools_app/widgets/calculator/icons_options_history.dart';
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
            _CalculatorPage(),
            _HistoryPage(),
          ],
        ),
      ),
    );
  }
}

class _HistoryPage extends StatelessWidget {
  const _HistoryPage();

  @override
  Widget build(BuildContext context) {
    final historyListProvider =
        Provider.of<HistoryListProvider>(context, listen: false);
    historyListProvider.cargarScans();
    return const Stack(
      children: [
        BackgroundHome(
          colors: [
            Color(0xff08bea5),
            Color(0xff344357),
            Color(0xff202935),
          ],
        ),
        IconsOptionsHistory(),
        HistoryTiles(),
      ],
    );
  }
}

class _CalculatorPage extends StatelessWidget {
  const _CalculatorPage();

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
        IconsOptionsDash(),
        CalculatorDash(),
      ],
    );
  }
}
