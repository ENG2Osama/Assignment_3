import 'dart:developer';

import 'package:assignment2/Model/BottomNavigationBar.dart';
import 'package:assignment2/View/ProfilePage.dart';
import 'package:assignment2/View/ViewCard.dart';
import 'package:assignment2/View/favoriteProducts.dart';
import 'package:assignment2/View/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List<Widget> ListBottomNavigationBarPages = [
    homeScreen(),
    ViewShoppingCard(),
    FavoriteProducts(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
        builder: (context, BottomNavigationBarProvider value, child) =>
            BottomNavigationBar(
              onTap: (val) {
                value.changePage(val);
              },
              currentIndex: value.indexCurrent,
              unselectedItemColor: Colors.orange.shade200,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'السلة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'المفضلة',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'انا'),
              ],
            ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            iconSize: 37,
            onPressed: () {
              context.read<BottomNavigationBarProvider>().changePage(1);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        leading: IconButton(
          color: Theme.of(context).colorScheme.secondary,
          iconSize: 37,
          onPressed: () {},
          icon: Icon(Icons.filter_list_sharp),
        ),
        toolbarHeight: 80,
        title: Text('متجر اسامة', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Container(
        child: Consumer<BottomNavigationBarProvider>(
          builder: (context, value, child) =>
              ListBottomNavigationBarPages[value.indexCurrent],
        ),
      ),
    );
  }
}
