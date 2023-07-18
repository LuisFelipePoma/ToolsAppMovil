import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tools_app/models/models.dart';
import 'package:tools_app/providers/providers.dart';

class HistoryTiles extends StatelessWidget {
  const HistoryTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final historyListProvider = Provider.of<HistoryListProvider>(context);
    final history = historyListProvider.history;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.25),
      child: Center(
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: history.length,
          itemBuilder: (_, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: const Color.fromRGBO(146, 40, 150, 0.5),
            ),
            onDismissed: (direction) {
              Provider.of<HistoryListProvider>(context, listen: false)
                  .borrarPorId(history[index].id!);
            },
            child: ListTile(
              leading: const Icon(
                Icons.functions_outlined,
                color: Color(0xff55f5de),
              ),
              title: Text(
                history[index].prompt,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                history[index].result,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white),
              onTap: () => _launchUrlUtils(context, history[index]),
            ),
          ),
        ),
      ),
    );
  }
}

_launchUrlUtils(BuildContext context, HistoryModel scan) {
  // ignore: avoid_print
  print(scan.result);
}
