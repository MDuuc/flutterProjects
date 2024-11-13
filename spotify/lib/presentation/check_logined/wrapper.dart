import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify/presentation/auth/pages/signin_page.dart';
import 'package:spotify/presentation/home/pages/home_page.dart';
import 'package:spotify/presentation/splash/pages/splash_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }else{
            if(snapshot.data == null){
              return SplashPage();
            }else{
              return HomePage();
            }
          }
        }
        ),
    );
  }
}