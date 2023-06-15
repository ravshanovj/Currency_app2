import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int count = 1;
  void increment() {
    count++;
    notifyListeners();
    print(count);
  }
}
