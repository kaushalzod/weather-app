import 'package:flutter/material.dart';
import 'package:weather_app/core/storage/local_storage.dart';

class HistoryVM extends ChangeNotifier {
  List<String> history = [];

  HistoryVM() {
    getHistory();
  }

  void getHistory() {
    List<String>? storageHistory = LocalStorage.getStringList("history");
    history = [...storageHistory ?? []];
  }

  void addHistory(String city, {bool update = true}) {
    if (history.contains(city)) {
      history.remove(city);
    }
    history = [city, ...history];
    while (history.length > 10) {
      history.removeLast();
    }
    LocalStorage.setStringList("history", history);
    if (update) {
      notifyListeners();
    }
  }

  void removeHistory(String city) {
    if (history.contains(city)) {
      history.remove(city);
      LocalStorage.setStringList("history", history);
      notifyListeners();
    }
  }

  void clearHistory() {
    LocalStorage.remove("history");
    history = [];
    notifyListeners();
  }
}
