import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/product.dart';

class FirestoreService {
  static final CollectionReference productsRef = FirebaseFirestore.instance
      .collection('products');

  static Stream<List<Product>> productsStream() {
 

    return productsRef
        .orderBy('title')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) =>
               Product.fromDoc(doc)).toList(),
        );
  }

  
  
}
