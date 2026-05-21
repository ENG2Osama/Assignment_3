import 'package:assignment2/Model/BottomNavigationBar.dart';
import 'package:assignment2/Model/favoriteProducte.dart';
import 'package:assignment2/Model/productsDetails.dart';
import 'package:assignment2/Model/productsModel.dart';
import 'package:assignment2/Model/shoppingCard.dart';
import 'package:assignment2/View/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Productsmodel()),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Productsdetails()),
        ChangeNotifierProvider(create: (context) => FavoriteProducte()),
        ChangeNotifierProvider(create: (context) => Shoppingcard()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.orange,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.grey.shade50,
          onSurface: Colors.black,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          bodyMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.orange,
          ),
          bodySmall: TextStyle(fontSize: 22, color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.labelLarge,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.orange,

            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
