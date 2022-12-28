import 'package:flutter/material.dart';
import 'package:motoshop_reborn/models/firebasemodel.dart';
import 'package:motoshop_reborn/page/form_update.dart';

import 'package:motoshop_reborn/provider/firebase_provider.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:motoshop_reborn/widget/callwidget.dart';
import 'package:motoshop_reborn/widget/menuwidget.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List notfound = [
    "https://keera.wajokab.go.id/img/no-image.png",
    "https://keera.wajokab.go.id/img/no-image.png"
  ];
  void _alertDialog(Function function, String teks) {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Apakah kamu ingin " + teks),
      title: Text("Konfirmasi"),
      actions: <Widget>[
        TextButton(child: Text("Ya Yakin"), onPressed: function),
        TextButton(
          child: Text("Nanti"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    MotorsNotifier motorsNotifier = Provider.of<MotorsNotifier>(context);

    _onMotorsDeleted(Motors motors) {
      motorsNotifier.deleteMotors(motors);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: customAppbar("DETAIL POST"),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 160,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Transform.rotate(
                      angle: math.pi / 2,
                      child: Icon(Icons.arrow_circle_down_rounded)),
                  Transform.rotate(
                      angle: -math.pi / 2,
                      child: Icon(Icons.arrow_circle_down_rounded)),
                ],
              )
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg1.png"), fit: BoxFit.cover))),
          ListView(
            children: [
              Container(
                  color: Colors.white,
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        disableCenter: true,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 0.88,
                        enableInfiniteScroll: false,
                        autoPlay: false),
                    items: motorsNotifier.currentMotors.gambar_lain != null
                        ? motorsNotifier.currentMotors.gambar_lain
                            .map((item) => ListView(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.network(
                                      item != null
                                          ? item
                                          : "https://keera.wajokab.go.id/img/no-image.png",
                                      height: 350,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ],
                                ))
                            .toList()
                        : [
                            "https://keera.wajokab.go.id/img/no-image.png",
                            "https://keera.wajokab.go.id/img/no-image.png"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Image.network(
                                      i,
                                      fit: BoxFit.cover,
                                    ));
                              },
                            );
                          }).toList(),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Judul",
                            style: regularTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(motorsNotifier.currentMotors.judul,
                                style: themeTextStyle.copyWith(
                                  fontSize: 26,
                                )),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return FormUpdate(
                                        isUpdating: true,
                                      );
                                    }));
                                  },
                                  child: Card(
                                    color: AppTheme.redBg,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Edit Post ",
                                          style: regularTextStyle.copyWith(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => deleteMotors(
                                      motorsNotifier.currentMotors,
                                      _onMotorsDeleted),
                                  child: Card(
                                    color: AppTheme.redBg,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Delete Post ",
                                          style: regularTextStyle.copyWith(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/location.jpg"))),
                                ),
                                Text(
                                  "Indonesia",
                                  style:
                                      regularTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Created: ", style: regularTextStyle),
                                Text("22/02/2022", style: regularTextStyle)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
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
                                    top: BorderSide(
                                        color: Colors.grey, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1),
                                    right: BorderSide(
                                        color: Colors.grey, width: 1),
                                  )),
                              height: 120,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: <Widget>[
                                  DetailMotors(
                                      motorsNotifier.currentMotors.merk_motor
                                          .toString(),
                                      "assets/merk.jpg",
                                      "Merk :"),
                                  DetailMotors(
                                      motorsNotifier.currentMotors.tipe_motor
                                          .toString(),
                                      "assets/tipe_motor.jpg",
                                      "Tipe Motor :"),
                                  DetailMotors(
                                      motorsNotifier.currentMotors.plat_motor
                                          .toString(),
                                      "assets/profile.jpg",
                                      "Plat Motor :"),
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
                                    top: BorderSide(
                                        color: Colors.grey, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1),
                                  )),
                              height: 120,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: <Widget>[
                                  DetailMotors(
                                      motorsNotifier.currentMotors.tahun_motor
                                          .toString(),
                                      "assets/calendar.jpg",
                                      "Tahun Motor :"),
                                  DetailMotors(
                                      motorsNotifier.currentMotors.jarak_tempuh
                                              .toString() +
                                          " Km",
                                      "assets/speedometer.jpg",
                                      "Jark Tempuh :"),
                                  DetailMotors(
                                      motorsNotifier.currentMotors.pajak_motor
                                          .toString(),
                                      "assets/true.jpg",
                                      "Pajak :"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                    child: Material(
                      elevation: 4,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              border: Border(
                                top: BorderSide(color: Colors.grey, width: 1),
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1),
                              )),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Deskripsi ",
                                      style: themeTextStyle.copyWith(
                                          fontSize: 26)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Column(
                                    children: [
                                      Text(
                                          motorsNotifier
                                                      .currentMotors.dekripsi !=
                                                  null
                                              ? motorsNotifier
                                                  .currentMotors.dekripsi
                                              : "Mohon diisi",
                                          style: regularTextStyle.copyWith(
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CallWidget("assets/calll.png", "Hubungi", 50, 0, 0, 50,
                            () {
                          _alertDialog(() async {
                            await call("62895392436676");
                          }, "menghubungi Admin?");
                        }),
                        CallWidget("assets/pesan.png", "PESAN", 0, 50, 50, 0,
                            () {
                          _alertDialog(() async {
                            await openUrl('https://wa.me/+62895392436676');
                          }, "memesan Motor?");
                        }),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
