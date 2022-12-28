import 'package:flutter/material.dart';
import 'package:motoshop_reborn/models/berandamodel.dart';
import 'package:motoshop_reborn/provider/feed_provider.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/widget/appbar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("FEED"),
      body: Selector<FeedProvider, List<Feed>>(
        selector: (context, provider) => provider.list,
        builder: (context, list, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = list.elementAt(index);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: AppTheme.redBg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 2, left: 2),
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/logo.png")),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Text(
                                "SecondNew_Shop",
                                style: regularTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  "Ikuti",
                                  style: regularTextStyle.copyWith(
                                      color: Colors.blue[400]),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(Icons.share_sharp, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                    item.gambarUtama,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  begin: FractionalOffset.centerRight,
                                  end: FractionalOffset.centerLeft,
                                  colors: [
                                    Colors.white,
                                    Colors.grey,
                                    Colors.grey,
                                    Colors.white
                                  ],
                                ))),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18, left: 12),
                                    child: Icon(Icons.favorite_border_outlined),
                                  ),
                                  Icon(Icons.comment),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(Icons.add_box_outlined),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text("SecondNew_Shop",
                                    style: regularTextStyle.copyWith(
                                        fontWeight: FontWeight.w600)),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: item.isi_feed
                                      .map((item) => Text(
                                            item,
                                            style: regularTextStyle,
                                          ))
                                      .toList())
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
