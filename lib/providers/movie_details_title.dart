import 'package:flutter/material.dart';

class MovieDetailsTitleProvider extends ChangeNotifier {
  String title;

  void setTitle(String t) {
    title = t;
    notifyListeners();
  }

  void clearTitle() {
    title = "";
    notifyListeners();
  }
}
