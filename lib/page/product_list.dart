import 'package:flutter/material.dart';
import 'package:motoshop_reborn/page/detail_page.dart';
import 'package:motoshop_reborn/page/form_update.dart';
import 'package:motoshop_reborn/provider/firebase_provider.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:animated_card/animated_card.dart';
import 'dart:io';

class Artikel extends StatefulWidget {
  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  @override
  void initState() {
    MotorsNotifier motorsNotifier =
        Provider.of<MotorsNotifier>(context, listen: false);
    getMotors(motorsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MotorsNotifier motorsNotifier = Provider.of<MotorsNotifier>(context);
    return Scaffold(
      appBar: customAppbar("LIST POST"),
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg1.png"), fit: BoxFit.cover))),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  initDelay: Duration(milliseconds: 1),
                  duration: Duration(seconds: 1),
                  curve: Curves.decelerate,
                  onRemove: () => motorsNotifier.motorsList[index],
                  child: GestureDetector(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  .motorsList[index].merk_motor
                                              : "Mohon diisi",
                                          style: regularTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      Text(
                                          motorsNotifier.motorsList[index]
                                                      .tipe_motor !=
                                                  null
                                              ? motorsNotifier
                                                  .motorsList[index].tipe_motor
                                              : "Mohon diisi",
                                          style: regularTextStyle.copyWith(
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
                                      style: TextStyle(fontSize: 25),
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
                  ));
            },
            itemCount: motorsNotifier.motorsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.transparent,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.red,
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          motorsNotifier.currentMotors = null;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return FormUpdate(
              isUpdating: false,
            );
          }));
        },
      ),
    );
  }
}
