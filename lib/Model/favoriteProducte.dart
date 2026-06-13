import 'dart:async';

import 'package:assignment2/Model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteProducte extends ChangeNotifier {
  final List<Product> favoriteProducts = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
  _favoritesSubscription;
  String? _uid;

  void setUser(String uid) {
    if (_uid == uid) return;
    _uid = uid;
    _favoritesSubscription?.cancel();
    favoriteProducts.clear();
    _favoritesSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .snapshots()
        .listen((snapshot) {
          favoriteProducts.clear();
          for (final doc in snapshot.docs) {
            favoriteProducts.add(Product.fromDoc(doc));
          }
          notifyListeners();
        });
  }

  Future<void> addFavoriteProduct(Product product) async {
    if (_uid == null) return;
    final doc = FirebaseFirestore.instance
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(product.id);
    await doc.set(product.toMap());
  }

  Future<void> removeFavoriteProduct(String id) async {
    if (_uid == null) return;
    final doc = FirebaseFirestore.instance
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(id);
    await doc.delete();
  }

  void clearFavorites() {
    _favoritesSubscription?.cancel();
    _favoritesSubscription = null;
    _uid = null;
    favoriteProducts.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _favoritesSubscription?.cancel();
    super.dispose();
  }
}
