import 'package:flutter/material.dart';
import 'package:motoshop_reborn/page/splashpage_menu/onboarding.dart';
import 'package:motoshop_reborn/provider/auth_services.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:provider/provider.dart';

import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  _SplashPageState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onbording()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: getClipper2(),
            child: Container(
              color: AppTheme.redConst,
            ),
          ),
          ClipPath(
            clipper: getClipper3(),
            child: Container(
              color: AppTheme.redBg,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage("assets/logoonly.png"),
            ),
          )
        ],
      ),
    );
  }
}

class getClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width + 325, 0.0);
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

class getClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0.0, size.height + 50);
    path.lineTo(size.width + 370, 0.0);
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

class SplashPage2 extends StatefulWidget {
  @override
  State<SplashPage2> createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/bg.png"),
            ),
            ClipPath(
              clipper: getClipper4(),
              child: Container(color: AppTheme.redBg),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text("LOGIN",
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/logoonly3.png"))),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2 + 150,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 4,
                        color: Colors.black,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          highlightColor: Colors.blue,
                          splashColor: Colors.blue,
                          onTap: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                            ;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image(
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.contain,
                                  image: AssetImage("assets/googlelogo.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Sign in Google",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 4,
                          color: AppTheme.redBg,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            highlightColor: Colors.blue,
                            splashColor: Colors.blue,
                            onTap: () async {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.logout();
                              ;
                            },
                            child: Center(
                              child: Text(
                                "Sign in Guest",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class getClipper4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 2 - 80);
    path.lineTo(size.width, size.height - 300);
    path.lineTo(size.width, size.height - 380);
    path.lineTo(0.0, size.height / 2 - 160);
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
