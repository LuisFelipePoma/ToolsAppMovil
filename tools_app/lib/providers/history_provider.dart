import 'package:flutter/cupertino.dart';
import 'package:tools_app/services/services.dart';

class HistoryListProvider extends ChangeNotifier {
  List<HistoryModel> history = [];

  nuevoHistory({prompt, result}) async {
    final nuevoHistory = HistoryModel(prompt: prompt, result: result);
    final id = await DBProvider.db.nuevoHistory(nuevoHistory);
    // ASignar el ID de la base de datos
    nuevoHistory.id = id;

    history.add(nuevoHistory);
    notifyListeners();
    return nuevoHistory;
  }

  cargarScans() async {
    final history = await DBProvider.db.getAllHistory();
    this.history = [...?history];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAll();
    history = [];
    notifyListeners();
  }

  borrarPorId(int id) async {
    await DBProvider.db.deleteHistory(id);
    // cargarScans();
  }
}
