import 'package:assignment2/Model/shoppingCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewShoppingCard extends StatelessWidget {
  ViewShoppingCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      width: double.infinity,
      child: context.read<Shoppingcard>().ShoppingcardList.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 7),
                Text(
                  'منتجات السلة',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Consumer<Shoppingcard>(
                    builder: (context, value, child) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 120,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(7),
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.amber,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${value.ShoppingcardList[index]["image"]}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 3),
                                          Text(
                                            '${value.ShoppingcardList[index]["title"]}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${value.ShoppingcardList[index]["price"]}\$',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.secondary,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 30),
                                          Text(
                                            'الكمية ${value.ShoppingcardList[index]["Count"]}',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: value.ShoppingcardList.length,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Selector<Shoppingcard, double>(
                  selector: (context, value) => value.totalPrice,
                  builder: (context, value, child) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'شراء الان ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          "${value} المجموع",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: Colors.black, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(child: Text('لا يوجد عناصر')),
    );
  }
}
