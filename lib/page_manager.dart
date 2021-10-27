import 'package:flutter/foundation.dart';

class PageManager extends ChangeNotifier {
  int _activePage = 0;

  int get activePage => _activePage;

  void changePage(int n) {
    _activePage = n;
    notifyListeners();
  }
}
