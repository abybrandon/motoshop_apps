import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motoshop_reborn/page/splashpage_menu/Splashpage.dart';
import 'package:motoshop_reborn/widget/navigationbar/navigationbar.dart';

class Wrapperr extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return NavigatorScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text("Something Went Wrong!"));
            } else {
              return SplashPage2();
            }
          }));
}
