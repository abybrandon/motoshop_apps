import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motoshop_reborn/models/berandamodel.dart';

class FeedProvider with ChangeNotifier {
  List<Feed> _list = [];
  List<Feed> get list => _list;

  FeedProvider() {
    FirebaseFirestore.instance.collection("feed").snapshots().listen((event) {
      _list = event.docs.map((e) => Feed.fromMap(e.data())).toList();
      notifyListeners();
    });
  }
}
