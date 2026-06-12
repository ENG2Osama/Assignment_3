import 'package:flutter/material.dart';

class Shoppingcard extends ChangeNotifier {
  List<Map<String, dynamic>> ShoppingcardList = [];
  double _totalPrice = 0;
  void addShoppingcard({
    required String title,
    required String description,
    required String id,
    required String price,
    required String linkImage,
    required int Count,
  }) {
    ShoppingcardList!.addAll([
      {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "image": linkImage,
        "Count": Count,
      },
    ]);

    _totalPrice += double.parse(price);

    notifyListeners();
  }

  void removeShoppingcard(int index) {
    ShoppingcardList.removeAt(index);
    total();
    notifyListeners();
  }

  get totalPrice => _totalPrice;
  void total() {
    _totalPrice = 0;
    ShoppingcardList.forEach((e) {
      _totalPrice += double.parse(e["price"]);
    });
  }
}
