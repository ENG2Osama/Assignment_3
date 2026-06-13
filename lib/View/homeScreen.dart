import 'package:assignment2/Model/product.dart';
import 'package:assignment2/View/DetailsProducte.dart';
import 'package:assignment2/View/ViewProducte.dart';
import 'package:assignment2/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});
  static final CollectionReference productsRef = FirebaseFirestore.instance
      .collection('products');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'المنتجات الشائعة',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: FirestoreService.productsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                }

                final products = snapshot.data ?? [];
                if (products.isEmpty) {
                  return const Center(child: Text('لا يوجد منتجات'));
                }

                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Detailsproducte(
                              price: product.price.toString(),

                              description: product.description,
                              linkImage: product.image,
                              nameProduct: product.title,
                              id: product.id,
                            ),
                          ),
                        );
                      },
                      child: ViewProducte(
                        LinkImage: product.image,
                        nameProduct: product.title,
                        price: product.price.toString(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
