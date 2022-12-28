import 'package:flutter/material.dart';
import 'package:motoshop_reborn/theme.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class CallWidget extends StatelessWidget {
  final String icon;
  final String teks;
  final double atasKiri;
  final double atasKanan;
  final double bawahKiri;
  final double bawahKanan;
  final Function ontap;
  CallWidget(this.icon, this.teks, this.atasKiri, this.atasKanan,
      this.bawahKanan, this.bawahKiri, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Center(
        child: GestureDetector(
          onTap: ontap,
          child: Material(
            child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.redBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(atasKiri),
                    bottomLeft: Radius.circular(bawahKiri),
                    topRight: Radius.circular(atasKanan),
                    bottomRight: Radius.circular(bawahKanan),
                  ),
                ),
                height: 70,
                width: 180,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      height: 35,
                      width: 35,
                      image: AssetImage(icon),
                    ),
                    Text(teks,
                        style: themeTextStyle.copyWith(
                            fontSize: 24, color: Colors.white)),
                  ],
                ))),
          ),
        ),
      ),
    );
  }
}

Future<void> call(String phoneNumber) async {
  await launch('tel:$phoneNumber');
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}
