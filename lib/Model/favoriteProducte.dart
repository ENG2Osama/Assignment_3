import 'package:flutter/material.dart';

class FavoriteProducte extends ChangeNotifier {
  List<Map<String, dynamic>> favoriteProducts = [];

  void addFavoriteProducte({
    required String name,
    required String description,
    required String id,
    required String price,
    required String linkImage,
  }) {
    favoriteProducts!.addAll([
      {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": linkImage,
      },
    ]);
    notifyListeners();
  }

  void removeFavoriteProducte(int index) {
    favoriteProducts.removeAt(index);
    notifyListeners();
  }
}
