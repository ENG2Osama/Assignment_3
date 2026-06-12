import 'dart:developer';

import 'package:assignment2/Model/favoriteProducte.dart';
import 'package:assignment2/Model/shoppingCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detailsproducte extends StatelessWidget {
  String nameProduct;
  String linkImage;
  String description;
  String price;
  String id;
  Detailsproducte({
    super.key,
    required this.description,
    required this.id,
    required this.linkImage,
    required this.nameProduct,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nameProduct,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(linkImage)),
              ),
            ),

            SizedBox(height: 10),
            Text(nameProduct, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 5),

            Text(description, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 7),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<Shoppingcard>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () {
                  value.addShoppingcard(
                    Count: 1,
                    title: nameProduct,
                    description: description,
                    id: id,
                    price: price,
                    linkImage: linkImage,
                  );
                  log('ooooooo');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'تم الإضافة للسلة',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_cart, size: 25),
                    SizedBox(width: 7),
                    Text(
                      'النتقل الى السلة ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<FavoriteProducte>(
              builder: (context, value, child) {
                int index = value.favoriteProducts.indexWhere(
                  (element) => element["id"] == id,
                );

                bool isFavorite = index != -1;
                return IconButton(
                  iconSize: 35,
                  color: Colors.red,
                  onPressed: () {
                    if (!isFavorite) {
                      value.addFavoriteProducte(
                        name: nameProduct,
                        description: description,
                        id: id,
                        price: price,
                        linkImage: linkImage,
                      );
                    } else {
                      value.removeFavoriteProducte(index);
                    }
                  },
                  icon: isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_outline_sharp),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
