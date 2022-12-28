import 'package:flutter/material.dart';
import 'package:motoshop_reborn/theme.dart';

class Bannerr extends StatelessWidget {
  final String imageUrl;
  Bannerr(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red[700], width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imageUrl))),
        ),
      ),
    );
  }
}

class Brands extends StatelessWidget {
  final String imageUrl;
  Brands(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(38, 8, 8, 8),
      child: ClipOval(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

class WidgetDetail extends StatelessWidget {
  final double tinggi;
  WidgetDetail(this.tinggi);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 8),
        child: Row(
          children: [
            Material(
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                      right: BorderSide(color: Colors.grey, width: 1),
                    )),
                height: 90,
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                height: 30,
                                width: 30,
                                image: AssetImage("assets/profile.jpg"),
                              ),
                              Text("Kode Jual : ",
                                  style:
                                      regularTextStyle.copyWith(fontSize: 12))
                            ],
                          ),
                          Text("001 ",
                              style: regularTextStyle.copyWith(fontSize: 12))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    )),
                height: tinggi,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailMotors extends StatelessWidget {
  final String icon;
  final String subTittle;
  final String detail;
  DetailMotors(this.detail, this.icon, this.subTittle);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 2),
                child: Image(
                  height: 30,
                  width: 30,
                  fit: BoxFit.fill,
                  image: AssetImage(icon),
                ),
              ),
              Text(subTittle, style: regularTextStyle.copyWith(fontSize: 12))
            ],
          ),
          Text(detail, style: regularTextStyle.copyWith(fontSize: 12))
        ],
      ),
    );
  }
}
