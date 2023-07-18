import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/providers/providers.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _RowButtons(
          colors: [Color(0xff9f9f9f), Color(0xff28968F)],
          data: ['AC', '( )', '%', '/'],
        ),
        _RowButtons(
          colors: [Color(0xff313131), Color(0xff28968F)],
          data: ['7', '8', '9', 'x'],
        ),
        _RowButtons(
          colors: [Color(0xff313131), Color(0xff28968F)],
          data: ['4', '5', '6', '-'],
        ),
        _RowButtons(
          colors: [Color(0xff313131), Color(0xff28968F)],
          data: ['1', '2', '3', '+'],
        ),
        _RowButtons(
          colors: [Color(0xff313131), Color(0xff28968F)],
          data: ['0', '.', 'CE', '='],
        ),
      ],
    );
  }
}

class _RowButtons extends StatelessWidget {
  const _RowButtons({
    required this.colors,
    required this.data,
  });
  final List<Color> colors;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Buttons(color: colors[0], data: data[0]),
          _Buttons(color: colors[0], data: data[1]),
          _Buttons(color: colors[0], data: data[2]),
          _Buttons(color: colors[1], data: data[3]),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.color,
    required this.data,
  });

  final Color color;
  final String data;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final historyListProvider = Provider.of<HistoryListProvider>(context);

    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    );

    const Color colorTouch = Color.fromRGBO(82, 147, 219, 0.2);
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.20,
        height: size.height * 0.1,
        decoration: boxDecoration,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            elevation: MaterialStateProperty.all(10),
            overlayColor: MaterialStateProperty.all(colorTouch),
          ),
          onPressed: () async {
            if (data == 'AC') {
              calculatorProvider.clearPrompt();
              calculatorProvider.isOpenParan = false;
              return;
            }
            if (data == 'CE') {
              calculatorProvider.erasePrompt();
              return;
            }
            if (data == '=') {
              await calculatorProvider.calculatePrompt();
							calculatorProvider.isOnResult = true;
              await historyListProvider.nuevoHistory(
                  prompt: calculatorProvider.previousPrompt,
                  result: calculatorProvider.result);
              return;
            }
            if (data == '.') {
              if (calculatorProvider.isOnDecimals) return;
            }
            if (data == '( )') {
              calculatorProvider.isOpenParan
                  ? calculatorProvider.setPrompt(')')
                  : calculatorProvider.setPrompt('(');

              return;
            }

            calculatorProvider.setPrompt(data);
          },
          child: Text(data,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
