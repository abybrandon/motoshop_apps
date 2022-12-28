//kelebihan menggunakan provider
//cukup melakukan 1 kl listening, bisa mengupdate tampilan dimana saja;
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:motoshop_reborn/widget/dummywidget/dummywidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _currentFood;

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);
  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }
}

getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("food").get();

  List<Food> _foodList = [];

  snapshot.docs.forEach((document) {
    Food food = Food.fromMap(document.data());
    _foodList.add(food);
  });
  foodNotifier.foodList = _foodList;
}
