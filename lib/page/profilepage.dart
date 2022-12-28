import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:motoshop_reborn/widget/widgetprofile.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: customAppbar("PROFILE"),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: getClipper(),
            child: Container(
              color: Colors.redAccent[700],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text("Profile Page",
                    style: themeTextStyle.copyWith(
                        fontSize: 35, color: Colors.white))),
          ),
          Positioned(
            width: 430.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(user.photoURL ??
                              "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132__340.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height * .42,
              width: MediaQuery.of(context).size.width * 0.89,
              child: Column(
                children: <Widget>[
                  ProfileTile(
                      "Username :  " + user.displayName, Icons.verified_user),
                  ProfileTile("Email :  " + user.email, Icons.email),
                  ProfileTile(
                      "CHAT ADMIN : 0895392436676", Icons.contact_phone),
                  ProfileTile("Follow FB & IG SecondNew_Shop", Icons.facebook),
                  IconLogo("assets/logoonly.png")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // ignore: todo
    // TODO: implement shouldReclip
    return true;
  }
}
