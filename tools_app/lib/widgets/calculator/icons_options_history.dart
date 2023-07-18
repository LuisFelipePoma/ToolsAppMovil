import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';

class IconsOptionsHistory extends StatelessWidget {
  const IconsOptionsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final historyListProvider = Provider.of<HistoryListProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconOptions(
                function: () {
                  calculatorProvider.pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                icondata: Icons.calculate_outlined),
            _IconOptions(
                function: () {
                  historyListProvider.borrarTodos();
                },
                icondata: Icons.delete_forever_outlined)
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
