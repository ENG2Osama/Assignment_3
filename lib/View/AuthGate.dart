import 'package:assignment2/Model/favoriteProducte.dart';
import 'package:assignment2/View/LoginScreen.dart';
import 'package:assignment2/View/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData && snapshot.data != null) {
          final user = snapshot.data!;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<FavoriteProducte>().setUser(user.uid);
          });
          return Homepage();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<FavoriteProducte>().clearFavorites();
        });
        return LoginScreen();
      },
    );
  }
}
