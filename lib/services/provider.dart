import 'package:flutter/cupertino.dart';

class Manage extends ChangeNotifier {
  int currentIndex = 0;
  int score = 0;
  void increaseIndex() {
    if (currentIndex < 9) {
      currentIndex++;
      notifyListeners();
    }
  }

  void increaseScore() {
    score++;
    notifyListeners();
  }

  void clear() {
    score = 0;
    currentIndex = 0;
    notifyListeners();
  }
}
