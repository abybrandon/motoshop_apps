import 'package:flutter/material.dart';

import '../theme.dart';

class Splashtext extends StatelessWidget {
  final String text;
  Splashtext(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(text,
              style: themeTextStyle.copyWith(
                  fontSize: 40, fontStyle: FontStyle.italic)),
        ),
      ),
    );
  }
}

class Splashtext2 extends StatelessWidget {
  final String text;
  Splashtext2(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icon.png"), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                child: Text(text,
                    style: themeTextStyle.copyWith(
                        fontSize: 20, fontStyle: FontStyle.italic)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
