import 'package:flutter/widgets.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _indexCurrent = 0;
  int get indexCurrent => _indexCurrent;

  void changePage(int index) {
    _indexCurrent = index;
    notifyListeners();
  }
}
