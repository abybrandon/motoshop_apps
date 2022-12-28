import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motoshop_reborn/page/feed_page.dart';
import 'package:motoshop_reborn/page/main_page.dart';
import 'package:motoshop_reborn/page/product_list.dart';
import 'package:motoshop_reborn/page/profilepage.dart';
import 'package:motoshop_reborn/theme.dart';

class NavigatorScreen extends StatefulWidget {
  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List<Widget> _listPages = [
    ProductList(),
    Artikel(),
    MainPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.feed_outlined, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: AppTheme.redBg,
          animationCurve: Curves.ease,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: _listPages[_page]);
  }
}
