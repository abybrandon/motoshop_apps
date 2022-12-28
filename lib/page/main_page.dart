import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motoshop_reborn/page/detail_page.dart';
import 'package:motoshop_reborn/provider/firebase_provider.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:motoshop_reborn/widget/menuwidget.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    MotorsNotifier motorsNotifier =
        Provider.of<MotorsNotifier>(context, listen: false);
    getMotors(motorsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    MotorsNotifier motorsNotifier =
        Provider.of<MotorsNotifier>(context, listen: true);
    return Scaffold(
      appBar: customAppbar("HOME"),
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg1.png"), fit: BoxFit.cover))),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Explore Now ",
                  style: regulerTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Bannerr("assets/spanduk01.png"),
                      Bannerr("assets/spanduk02.png"),
                      Bannerr("assets/spanduk01.png"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular Brands ",
                  style: regulerTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Brands("assets/suzuki.jpg"),
                  Brands("assets/honda.jpg"),
                  Brands("assets/kawasaki.jpg"),
                  Brands("assets/yamaha.png"),
                ],
              ),
              Center(
                child: Container(
                  width: screenWidth - 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border(
                        left: BorderSide(width: 1, color: Colors.grey[350]),
                        right: BorderSide(width: 1, color: Colors.grey[350]),
                        bottom: BorderSide(width: 1, color: Colors.grey[350]),
                        top: BorderSide(width: 1, color: Colors.grey[350])),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/search.jpg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text("Search"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Image.asset("assets/filter.jpg"),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        motorsNotifier.currentMotors =
                            motorsNotifier.motorsList[index];
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return DetailScreen();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Card(
                          color: AppTheme.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey[400], width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 16, 8, 8),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            width: 240,
                                            height: 140,
                                            image: NetworkImage(
                                              motorsNotifier.motorsList[index]
                                                          .gambar_utama !=
                                                      null
                                                  ? motorsNotifier
                                                      .motorsList[index]
                                                      .gambar_utama
                                                  : "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-no-image-available-icon-flat.jpg",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            motorsNotifier.motorsList[index]
                                                        .merk_motor !=
                                                    null
                                                ? motorsNotifier
                                                    .motorsList[index]
                                                    .merk_motor
                                                : "Mohon diisi",
                                            style: regularTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text(
                                            motorsNotifier.motorsList[index]
                                                        .tipe_motor !=
                                                    null
                                                ? motorsNotifier
                                                    .motorsList[index]
                                                    .tipe_motor
                                                : "Mohon diisi",
                                            style: regularTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text(
                                            motorsNotifier.motorsList[index]
                                                        .tahun_motor !=
                                                    null
                                                ? 'Tahun ' +
                                                    motorsNotifier
                                                        .motorsList[index]
                                                        .tahun_motor
                                                        .toString()
                                                : "Mohon diisi",
                                            style: regularTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text("Harga :",
                                          style: regularTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100),
                                      child: Text(
                                        NumberFormat.simpleCurrency(
                                                locale: Platform.localeName,
                                                decimalDigits: 0)
                                            .format(motorsNotifier
                                                        .motorsList[index]
                                                        .harga !=
                                                    null
                                                ? motorsNotifier
                                                    .motorsList[index].harga
                                                : 0),
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Icon(Icons.double_arrow_rounded),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: motorsNotifier.motorsList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.transparent,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
