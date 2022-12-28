import 'package:flutter/material.dart';

import '../theme.dart';

class ProfileTile extends StatelessWidget {
  final String text;
  final IconData icon;
  ProfileTile(this.text, this.icon);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
            Text(
              text,
              style: profileTextStyle.copyWith(fontWeight: FontWeight.normal),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

class IconLogo extends StatelessWidget {
  final String text;
  IconLogo(this.text);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(text)))),
    );
  }
}
