import 'package:assignment2/Model/favoriteProducte.dart';
import 'package:assignment2/View/ViewProducte.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(7),
        width: double.infinity,
        child: context.watch<FavoriteProducte>().favoriteProducts.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 7),
                  Text(
                    'المنتجات المفضلة',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Consumer<FavoriteProducte>(
                      builder: (context, value, child) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 260,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, index) => ViewProducte(
                          LinkImage: value.favoriteProducts[index].image,
                          nameProduct: value.favoriteProducts[index].title,
                          price: value.favoriteProducts[index].price
                              .toStringAsFixed(2),
                        ),
                        itemCount: value.favoriteProducts.length,
                      ),
                    ),
                  ),
                ],
              )
            : Center(child: Text('لا يوجد عناصر')),
      ),
    );
  }
}
