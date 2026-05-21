import 'package:flutter/material.dart';

class Shoppingcard extends ChangeNotifier {
  List<Map<String, dynamic>> ShoppingcardList = [];
  int _totalPrice = 0;
  void addShoppingcard({
    required String name,
    required String description,
    required String id,
    required String price,
    required String linkImage,
    required int Count,
  }) {
    ShoppingcardList!.addAll([
      {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": linkImage,
        "Count": Count,
      },
    ]);
    total();

    notifyListeners();
  }

  void removeShoppingcard(int index) {
    ShoppingcardList.removeAt(index);
    total();
    notifyListeners();
  }

  get totalPrice => _totalPrice;
  void total() {
    ShoppingcardList.forEach((e) {
      _totalPrice += int.parse(e["price"]);
    });
  }
}
