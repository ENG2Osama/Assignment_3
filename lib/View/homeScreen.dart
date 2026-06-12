import 'package:assignment2/Model/productsDetails.dart';
import 'package:assignment2/View/DetailsProducte.dart';
import 'package:assignment2/View/ViewProducte.dart';
import 'package:assignment2/service/getProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetProduct.getProduct(context);

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
          FutureBuilder(
            future: GetProduct.getProduct(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else
                return Expanded(
                  child: GridView.builder(
                    itemCount: context.watch<Productsdetails>().products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 260,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) => Consumer<Productsdetails>(
                      builder: (context, value, child) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Detailsproducte(
                                price: value.products[index]["price"]
                                    .toString(),
                                description:
                                    value.products[index]["description"],
                                linkImage: value.products[index]["image"],
                                nameProduct: value.products[index]["title"],
                                id: value.products[index]["id"].toString(),
                              ),
                            ),
                          );
                        },
                        child: ViewProducte(
                          LinkImage: '${value.products[index]["image"]}',
                          nameProduct: '${value.products[index]["title"]}',
                          price: '${value.products[index]["price"]}',
                        ),
                      ),
                    ),
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}
