import 'package:flutter/material.dart';

class ViewProducte extends StatelessWidget {
  String LinkImage;
  String nameProduct;
  String price;
  ViewProducte({
    super.key,
    required this.LinkImage,

    required this.nameProduct,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSecondary,
      child: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 170,
              width: 240,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: NetworkImage(LinkImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5),

            Container(
              alignment: Alignment.topLeft,

              margin: EdgeInsets.only(right: 3),
              child: Text(
                nameProduct,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            SizedBox(height: 5),

            Container(
              margin: EdgeInsets.only(right: 3),
              child: Text(
                '$price \$',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
