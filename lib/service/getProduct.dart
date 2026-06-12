import 'dart:convert';
import 'dart:math';

import 'package:assignment2/Model/productsDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class GetProduct {
 static Future<void> getProduct(BuildContext context) async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    print(response.body);
    context.read<Productsdetails>().products = jsonDecode(response.body) ;
    context.read<Productsdetails>().notifyListeners();
  }
}
